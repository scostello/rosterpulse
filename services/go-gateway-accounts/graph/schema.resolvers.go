package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	acct "github.com/scostello/rosterpulse/protos/accounts"
	"github.com/scostello/rosterpulse/services/go-gateway-accounts/graph/generated"
	"github.com/scostello/rosterpulse/services/go-gateway-accounts/graph/model"
	"google.golang.org/grpc"
)

func (r *mutationResolver) CreateAccount(ctx context.Context, input model.AccountInput) (*model.CreateAccountResponse, error) {
	conn, err := grpc.Dial("go-service-accounts-dev:80", grpc.WithInsecure())
	defer conn.Close()
	if err != nil {
		fmt.Println("Error dialing go-service-accounts: ", err)
	}

	acctClient := acct.NewAccountsClient(conn)

	payload := &acct.CreateAccountRequest{
		Name: input.Name,
		Email: input.Email,
	}

	resp, err := acctClient.CreateAccount(ctx, payload)
	if err != nil {
		return nil, err
	}

	fmt.Println(fmt.Sprintf("response from go-service-accounts: %+v", resp))

	return &model.CreateAccountResponse{Success: true}, nil
}

func (r *queryResolver) Me(ctx context.Context) (*model.User, error) {
	return &model.User{
		ID:       "1234",
		Username: "Me",
	}, nil
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
