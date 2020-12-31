package clients

import (
	"fmt"
	acct "github.com/scostello/rosterpulse/protos/accounts"
	"google.golang.org/grpc"
)

func GetAccountsClient() acct.AccountsClient {
	conn, err := grpc.Dial("accounts-service-dev:80", grpc.WithInsecure())
	if err != nil {
		fmt.Println("Error dialing accounts-service: ", err)
	}

	return acct.NewAccountsClient(conn)
}
