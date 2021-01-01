package events

type AccountCreated struct {
	Accountid string `json:"accountid"`
}

type Metadata struct {
	Timestamp int64 `json:"timestamp"`
}
