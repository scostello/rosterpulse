package models

import "github.com/gofrs/uuid"

type AccountItem struct {
	Accountid uuid.UUID `json:"accountid"`
	Name  string    `json:"name"`
	Email string `json:"email"`

}
