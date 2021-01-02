package interfaces

import (
	"context"
	"github.com/scostello/rosterpulse/services/accounts-service/models"
)

type AccountsPersister interface {
	CreateAccount(ctx context.Context, account *models.AccountItem) ()
}
