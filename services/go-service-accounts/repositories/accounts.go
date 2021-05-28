package repositories

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/EventStore/EventStore-Client-Go/client"
	"github.com/EventStore/EventStore-Client-Go/client/filtering"
	"github.com/EventStore/EventStore-Client-Go/messages"
	"github.com/EventStore/EventStore-Client-Go/position"
	"github.com/EventStore/EventStore-Client-Go/streamrevision"
	"github.com/gofrs/uuid"
	logger "github.com/scostello/rosterpulse/libraries/logger-go/pkg"
	"github.com/scostello/rosterpulse/services/go-service-accounts/models"
	"github.com/scostello/rosterpulse/services/go-service-accounts/repositories/commands"
	"github.com/scostello/rosterpulse/services/go-service-accounts/repositories/events"
	"time"
)

type AccountsRepository struct{
	logger logger.FluentLogger
}

var (
	esclient *client.Client
)

func init() {
	cxnString := "esdb://chart-eventstore.default.svc.cluster.local:2113?Tls=false"
	config, err := client.ParseConnectionString(cxnString)
	if err != nil {
		fmt.Println("Error parsing connection string: ", err)
	}

	esclient, err = client.NewClient(config)
	if err != nil {
		fmt.Println("Error creating new eventstoredb client: ", err)
	}
}

func NewAccountsRepository(logger logger.FluentLogger) *AccountsRepository {
	return &AccountsRepository{logger: logger}
}

func (repo *AccountsRepository) CreateAccount(ctx context.Context, account *models.AccountItem) {
	eventid, err := uuid.NewV4()
	if err != nil {
		repo.logger.WithError(err).Error("Error creating event uuid: ")
	}

	command := &commands.CreateAccount{Accountid: account.Accountid, Name: account.Name}
	data, err := json.Marshal(command)
	if err != nil {
		repo.logger.WithError(err).Error("Error marshalling event data: ")
	}

	metadata, err := json.Marshal(&events.Metadata{
		Timestamp: time.Now().Unix(),
	})
	if err != nil {
		repo.logger.WithError(err).Error("Error marshalling event metadata: ")
	}

	createAccount := messages.ProposedEvent{
		EventID:      eventid,
		EventType:    "create-account",
		ContentType:  "application/octet-stream",
		UserMetadata: metadata,
		Data:         data,
	}
	proposedEvents := []messages.ProposedEvent{
		createAccount,
	}

	err = esclient.Connect()
	defer esclient.Connection.Close()
	if err != nil {
		repo.logger.WithError(err).Error("Error dialing eventstoredb servers: ")
	}

	streamId := fmt.Sprintf("account-%s", account.Accountid.String())
	result, err := esclient.AppendToStream(ctx, streamId, streamrevision.StreamRevisionAny, proposedEvents)
	if err != nil {
		repo.logger.WithError(err).Error("Error appending event to stream")
	}

	repo.logger.Info(fmt.Sprintf("append stream result %+v", result))
}

func (repo *AccountsRepository) handleCommand(command messages.RecordedEvent) {
	repo.logger.Info(fmt.Sprintf("Received new command: %+v", command))
	commandData := &events.AccountCreated{}
	err := json.Unmarshal(command.Data, commandData)
	if err != nil {
		repo.logger.WithError(err).Error("Error unmarshalling command data")
	}
	repo.logger.Info(fmt.Sprintf("Command data: %+v", commandData))
}

func (repo *AccountsRepository) handleCheckpointReached(pos position.Position) {
	repo.logger.Info(fmt.Sprintf("Checkpoint has been reached: %+v", pos))
}

func (repo *AccountsRepository) handleSubscriptionDropped(reason string) {
	repo.logger.Info(fmt.Sprintf("Subscription was dropped: %+v", reason))
}

func (repo *AccountsRepository) ListenToCreateAccountCommands(ctx context.Context) {
	err := esclient.Connect()
	//defer esclient.Connection.Close()
	if err != nil {
		repo.logger.WithError(err).Error("Error dialing eventstoredb servers")
	}

	accountsFilter := filtering.NewStreamPrefixFilter([]string{"account-"})

	subscription, err := esclient.SubscribeToAllFiltered(
		ctx,
		position.StartPosition,
		false,
		filtering.NewDefaultSubscriptionFilterOptions(accountsFilter),
		repo.handleCommand,
		repo.handleCheckpointReached,
		repo.handleSubscriptionDropped,
	)
	if err != nil {
		repo.logger.WithError(err).Error("Error creating subscription")
	}

	err = subscription.Start()
	if err != nil {
		repo.logger.WithError(err).Error("Error starting subscription")
	}
	repo.logger.Info(fmt.Sprintf("Subscription was created!: %+v", subscription))
}
