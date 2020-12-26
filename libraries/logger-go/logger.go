package logger

import (
	"github.com/rs/zerolog"
	"io"
)

func New(w io.Writer, appID, appVersion string) *zerolog.Logger {
	logger := zerolog.New(w)
	return &logger
}
