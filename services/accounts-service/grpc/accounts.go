package grpc

import (
	"context"
	"fmt"
	"github.com/gofrs/uuid"
	pb "github.com/scostello/rosterpulse/protos/accounts"
	"github.com/scostello/rosterpulse/services/accounts-service/models"
	"github.com/scostello/rosterpulse/services/accounts-service/repositories/interfaces"
	"google.golang.org/grpc"
)

type AccountsServer struct{
	Persister interfaces.AccountsPersister
}

func RegisterResources(grpcServer *grpc.Server, persister interfaces.AccountsPersister) {
	pb.RegisterAccountsServer(grpcServer, &AccountsServer{ Persister: persister})
}

func (s *AccountsServer) CreateAccount(ctx context.Context, req *pb.CreateAccountRequest) (*pb.CreateAccountResponse, error) {
	fmt.Printf("received a request! %v", req)

	accountid, err := uuid.NewV4()
	if err != nil {
		fmt.Println("Error creating event uuid: ", err)
	}

	s.Persister.CreateAccount(ctx, &models.AccountItem{
		Accountid: accountid,
		Username:  req.Username,
	})

	account := &pb.AccountItem{Accountid: accountid.String()}
	return &pb.CreateAccountResponse{Account: account}, nil
}
