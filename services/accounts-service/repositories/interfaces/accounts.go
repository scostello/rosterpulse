package interfaces

import "context"

type AccountsPersister interface {
	CreateAccount(ctx context.Context) ()
}
