package internal

import (
	"github.com/rs/zerolog"
	"io"
)

type LogLevel int

const (
	Info LogLevel = iota
	Debug
)

type (
	LogFields map[string]interface{}

	FluentLogger interface {
		WithFields(logFields LogFields) FluentLogger
		WithMetadata(metadata LogFields) FluentLogger
		WithError(error error) FluentLogger
		WithScope(scope string) FluentLogger
		Info(message string) FluentLogger
		Debug(message string) FluentLogger
		Error(message string) FluentLogger
		Warn(message string) FluentLogger
	}

	emittingFluentLogger struct {
		emitter emitter
		logData logData
	}

	//extraFields map[string]interface{}

	logData struct {
		//extraFields
		appID      string
		appVersion string
		//appMetadata map[string]interface{}
		//tracingID   string
		//timestamp   time.Time
		//message     string
		//exception   error
	}

	emitter interface {
		emit(level LogLevel, data logData)
	}

	zerologEmitter struct {
		zerologger *zerolog.Logger
	}

	fluentLogger struct {
		appID      string
		appVersion string
		logEmitter emitter
	}
)

func New(w io.Writer, appID, appVersion string) *fluentLogger {
	//logger := zerolog.New(formatters.NewPrettyFormat())
	zeroLogger := zerolog.New(w)
	logger := &fluentLogger{
		appID:      appID,
		appVersion: appVersion,
		logEmitter: &zerologEmitter{zerologger: &zeroLogger},
	}
	return logger
}

func (e *fluentLogger) WithFields(logFields LogFields) FluentLogger {
	return e
}

func (e *fluentLogger) WithMetadata(metadata LogFields) FluentLogger {
	return e
}

func (e *fluentLogger) WithError(error error) FluentLogger {
	return e
}

func (e *fluentLogger) WithScope(scope string) FluentLogger {
	return e
}

func (e *fluentLogger) Info(message string) FluentLogger {
	data := logData{appID: "What-UP", appVersion: "0.1.0"}
	e.logEmitter.emit(Info, data)
	return e
}

func (e *fluentLogger) Debug(message string) FluentLogger {
	data := logData{appID: "What-UP", appVersion: "0.1.0"}
	e.logEmitter.emit(Debug, data)
	return e
}

func (e *fluentLogger) Error(message string) FluentLogger {
	return e
}

func (e *fluentLogger) Warn(message string) FluentLogger {
	return e
}

func (e *zerologEmitter) emit(level LogLevel, data logData) {
	event := e.zerologger.Info()
	if level == Debug {
		event = e.zerologger.Debug()
	}
	entry := event.
		Str("appID", data.appID).
		Str("appVersion", data.appVersion).
		Str("foo", "bar")
	//Time("timestampUTC", data.timestamp)

	entry.Send()
}

func mergeMaps(a, b map[string]interface{}) map[string]interface{} {
	newMap := copyMap(a)
	for key, value := range b {
		newMap[key] = value
	}
	return newMap
}

func copyMap(originalMap map[string]interface{}) map[string]interface{} {
	newMap := make(map[string]interface{})
	for key, value := range originalMap {
		newMap[key] = value
	}
	return newMap
}
