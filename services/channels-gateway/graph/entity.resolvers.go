package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"

	"github.com/scostello/rosterpulse/services/channels-gateway/graph/generated"
	"github.com/scostello/rosterpulse/services/channels-gateway/graph/model"
)

func (r *entityResolver) FindProductByUpc(ctx context.Context, upc string) (*model.Product, error) {
	for _, h := range hats {
		if h.Upc == upc {
			return h, nil
		}
	}
	return nil, nil
}

// Entity returns generated.EntityResolver implementation.
func (r *Resolver) Entity() generated.EntityResolver { return &entityResolver{r} }

type entityResolver struct{ *Resolver }
