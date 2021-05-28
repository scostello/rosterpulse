package clients

import (
	"fmt"
	acct "github.com/scostello/rosterpulse/protos/accounts"
	"google.golang.org/grpc"
)

func GetAccountsClient() acct.AccountsClient {
	conn, err := grpc.Dial("go-service-accounts-dev:80", grpc.WithInsecure())
	if err != nil {
		fmt.Println("Error dialing go-service-accounts: ", err)
	}

	return acct.NewAccountsClient(conn)
}
