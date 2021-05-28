package grpc

import (
	"context"
	"fmt"
	"github.com/gofrs/uuid"
	logger "github.com/scostello/rosterpulse/libraries/logger-go/pkg"
	pb "github.com/scostello/rosterpulse/protos/accounts"
	"github.com/scostello/rosterpulse/services/go-service-accounts/models"
	"github.com/scostello/rosterpulse/services/go-service-accounts/repositories/interfaces"
	"google.golang.org/grpc"
)

type AccountsServer struct {
	Persister interfaces.AccountsPersister
	logger    logger.FluentLogger
}

func RegisterResources(logger logger.FluentLogger, grpcServer *grpc.Server, persister interfaces.AccountsPersister) {
	pb.RegisterAccountsServer(grpcServer, &AccountsServer{Persister: persister, logger: logger})
}

func (s *AccountsServer) CreateAccount(ctx context.Context, req *pb.CreateAccountRequest) (*pb.CreateAccountResponse, error) {
	s.logger.Info(fmt.Sprintf("received a request! %v", req))

	accountid, err := uuid.NewV4()
	if err != nil {
		s.logger.WithError(err).Error("Error creating event uuid")
	}

	s.Persister.CreateAccount(ctx, &models.AccountItem{
		Accountid: accountid,
		Name:      req.Name,
	})

	account := &pb.AccountItem{Accountid: accountid.String()}
	return &pb.CreateAccountResponse{Account: account}, nil
}
