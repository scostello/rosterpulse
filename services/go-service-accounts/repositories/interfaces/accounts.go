package interfaces

import (
	"context"
	"github.com/scostello/rosterpulse/services/go-service-accounts/models"
)

type AccountsPersister interface {
	CreateAccount(ctx context.Context, account *models.AccountItem) ()
}
