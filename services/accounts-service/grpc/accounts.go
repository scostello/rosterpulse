package grpc

import (
	"context"
	"fmt"
	pb "github.com/scostello/rosterpulse/protos/accounts"
	"google.golang.org/grpc"
)

type AccountsServer struct{}

func RegisterResources(grpcServer *grpc.Server) {
	pb.RegisterAccountsServer(grpcServer, &AccountsServer{})
}

func (*AccountsServer) CreateAccount(ctx context.Context, req *pb.CreateAccountRequest) (*pb.CreateAccountResponse, error) {
	fmt.Printf("received a request! %v", req)
	account := &pb.AccountItem{Accountid: "123456"}
	return &pb.CreateAccountResponse{Account: account}, nil
}
