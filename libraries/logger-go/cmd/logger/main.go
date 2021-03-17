package main

import (
	"os"

	"github.com/scostello/rosterpulse/libraries/logger-go/internal"
)

func main() {
	logger := internal.New(os.Stdout, "my-cool-app", "0.1.0")
	//logger.Debug().Msg("Hello, World!")
	//
	//logger.Info().Msg("And another one...")

	logger.Info("sup")
	logger.Debug("sup")

	//fmt.Println("Hello, World!")
}

