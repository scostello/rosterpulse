package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	acct "github.com/scostello/rosterpulse/protos/accounts"
	"github.com/scostello/rosterpulse/services/accounts-gateway/graph/clients"
	"github.com/scostello/rosterpulse/services/accounts-gateway/graph/generated"
	"github.com/scostello/rosterpulse/services/accounts-gateway/graph/model"
)

func (r *mutationResolver) CreateAccount(ctx context.Context, userid string) (*model.CreateAccountResponse, error) {
	acctClient := clients.GetAccountsClient()
	payload := &acct.CreateAccountRequest{
		Userid: userid,
	}
	_, err := acctClient.CreateAccount(ctx, payload)
	if err != nil {
		return nil, err
	}

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
