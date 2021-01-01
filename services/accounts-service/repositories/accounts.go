package repositories

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/EventStore/EventStore-Client-Go/client"
	"github.com/EventStore/EventStore-Client-Go/messages"
	"github.com/EventStore/EventStore-Client-Go/position"
	"github.com/EventStore/EventStore-Client-Go/streamrevision"
	"github.com/gofrs/uuid"
	"github.com/scostello/rosterpulse/services/accounts-service/repositories/events"
	"time"
)

type AccountsRepository struct{}

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

func NewAccountsRepository() *AccountsRepository {
	return &AccountsRepository{}
}

func (repo *AccountsRepository) CreateAccount(ctx context.Context) {
	eventid, err := uuid.NewV4()
	if err != nil {
		fmt.Println("Error creating event uuid: ", err)
	}

	event := &events.AccountCreated{Accountid: "123456"}
	data, err := json.Marshal(event)
	if err != nil {
		fmt.Println("Error marshalling event data: ", err)
	}

	metadata, err := json.Marshal(&events.Metadata{
		Timestamp: time.Now().Unix(),
	})
	if err != nil {
		fmt.Println("Error marshalling event metadata: ", err)
	}

	testEvent := messages.ProposedEvent{
		EventID:      eventid,
		EventType:    "create-account",
		ContentType:  "application/octet-stream",
		UserMetadata: metadata,
		Data:         data,
	}
	proposedEvents := []messages.ProposedEvent{
		testEvent,
	}

	err = esclient.Connect()
	defer esclient.Connection.Close()
	if err != nil {
		fmt.Println("Error dialing eventstoredb servers: ", err)
	}

	result, err := esclient.AppendToStream(ctx, "accounts", streamrevision.StreamRevisionAny, proposedEvents)
	//result, err := esclient.AppendToStream(ctx, "accounts", streamrevision.NewStreamRevision(0), proposedEvents)
	if err != nil {
		fmt.Println("Error appending event to stream: ", err)
	}

	fmt.Println(fmt.Sprintf("append stream result %+v", result))
}

func handleCommand(command messages.RecordedEvent) {
	fmt.Println(fmt.Sprintf("Received new command: %+v", command))
	commandData := &events.AccountCreated{}
	err := json.Unmarshal(command.Data, commandData)
	if err != nil {
		fmt.Println("Error unmarshalling command data: ", err)
	}
	fmt.Println(fmt.Sprintf("Command data: %+v", commandData))
}

func handleCheckpointReached(pos position.Position) {
	fmt.Println(fmt.Sprintf("Checkpoint has been reached: %+v", pos))
}

func handleSubscriptionDropped(reason string) {
	fmt.Println(fmt.Sprintf("Subscription was dropped: %+v", reason))
}

func (repo *AccountsRepository) ListenToCreateAccountCommands(ctx context.Context) {
	err := esclient.Connect()
	//defer esclient.Connection.Close()
	if err != nil {
		fmt.Println("Error dialing eventstoredb servers: ", err)
	}

	subscription, err := esclient.SubscribeToStream(
		ctx,
		"accounts",
		uint64(0),
		false,
		handleCommand,
		handleCheckpointReached,
		handleSubscriptionDropped,
	)
	if err != nil {
		fmt.Println("Error creating subscription: ", err)
	}


	err = subscription.Start()
	if err != nil {
		fmt.Println("Error starting subscription: ", err)
	}
	fmt.Println(fmt.Sprintf("Subscription was created!: %+v", subscription))
}
