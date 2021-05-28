package main

import "github.com/scostello/rosterpulse/services/go-service-accounts/app"

func main() {
	a := app.NewApp()
	a.Initialize()
	a.Run()
}
