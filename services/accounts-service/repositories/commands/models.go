package commands

import "github.com/gofrs/uuid"

type CreateAccount struct {
	Accountid uuid.UUID `json:"accountid"`
	Username  string    `json:"username"`
}
