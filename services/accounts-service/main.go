package main

import "github.com/scostello/rosterpulse/services/accounts-service/app"

func main() {
	a := app.NewApp()
	a.Initialize()
	a.Run()
}
