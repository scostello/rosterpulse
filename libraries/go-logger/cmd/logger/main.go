package main

import (
	"fmt"
	"os"

	"github.com/scostello/rosterpulse/libraries/go-logger/pkg"
)

func main() {
	logger := pkg.New(os.Stdout, "my-cool-app", "0.1.0")
	//logger.Debug().Msg("Hello, World!")
	//
	//logger.Info().Msg("And another one...")

	data := pkg.LogFields{
		"one": "two",
		"nested": pkg.LogFields{
			"more": "stuff",
		},
	}

	entry := logger.WithFields(data)

	extraData := pkg.LogFields{
		"another": "set",
		"nested": pkg.LogFields{
			"this": "should be different",
		},
	}

	entry = entry.WithFields(extraData)

	entry.Info("this is info")
	entry.Debug("this is debug")
	entry.Warn("this is warn")
	entry.WithError(fmt.Errorf("problem ocurred")).Error("this is error")

	//fmt.Println("Hello, World!")
}

