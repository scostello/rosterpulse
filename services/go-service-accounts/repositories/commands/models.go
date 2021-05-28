package commands

import "github.com/gofrs/uuid"

type CreateAccount struct {
	Accountid uuid.UUID `json:"accountid"`
	Name      string    `json:"name"`
	Email     string    `json:"email"`
}
