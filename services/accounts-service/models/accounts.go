package models

import "github.com/gofrs/uuid"

type AccountItem struct {
	Accountid uuid.UUID `json:"accountid"`
	Username  string    `json:"username"`
}
