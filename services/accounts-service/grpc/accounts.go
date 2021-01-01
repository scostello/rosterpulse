package grpc

import (
	"context"
	"fmt"
	pb "github.com/scostello/rosterpulse/protos/accounts"
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

	s.Persister.CreateAccount(ctx)

	account := &pb.AccountItem{Accountid: "123456"}
	return &pb.CreateAccountResponse{Account: account}, nil
}
