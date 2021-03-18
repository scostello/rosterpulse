package internal

import (
	"encoding/json"
	"fmt"
	"github.com/rs/zerolog"
	"io"
	"path"
	"runtime"
	"time"
)

type LogLevel int

const (
	Info LogLevel = iota
	Debug
	Error
	Warn
	Fatal
)

type (
	LogFields map[string]interface{}

	FluentLogger interface {
		WithFields(logFields LogFields) FluentLogger
		WithMetadata(metadata LogFields) FluentLogger
		WithError(error error) FluentLogger
		WithScope(scope string) FluentLogger
		Info(message string)
		Debug(message string)
		Error(message string)
		Warn(message string)
	}

	logData struct {
		//extraFields
		appID       string
		appVersion  string
		appMetadata map[string]interface{}
		//tracingID   string
		timestamp time.Time
		message   string
		exception error
	}

	emitter interface {
		emit(level LogLevel, data logData)
	}

	fluentLogger struct {
		emitter emitter
		logData logData
	}

	zerologEmitter struct {
		zerologger *zerolog.Logger
	}
)

func New(w io.Writer, appID, appVersion string) *fluentLogger {
	zeroLogger := zerolog.New(w)
	return &fluentLogger{
		emitter: &zerologEmitter{zerologger: &zeroLogger},
		logData: logData{appID: appID, appVersion: appVersion},
	}
}

func (l *fluentLogger) WithFields(logFields LogFields) FluentLogger {
	l.logData.appMetadata = shallowMergeMaps(l.logData.appMetadata, logFields)
	return l
}

func (l *fluentLogger) WithMetadata(metadata LogFields) FluentLogger {
	l.WithFields(metadata)
	return l
}

func (l *fluentLogger) WithError(error error) FluentLogger {
	l.logData.exception = error
	return l
}

func (l *fluentLogger) WithScope(scope string) FluentLogger {
	return l
}

func (l *fluentLogger) Info(message string) {
	l.logData.message = message
	l.emitter.emit(Info, l.logData)
}

func (l *fluentLogger) Debug(message string) {
	l.logData.message = message
	l.emitter.emit(Debug, l.logData)
}

func (l *fluentLogger) Error(message string) {
	l.logData.message = message
	l.emitter.emit(Error, l.logData)
}

func (l *fluentLogger) Warn(message string) {
	l.logData.message = message
	l.emitter.emit(Warn, l.logData)
}

type SourceHook struct{}

func (h SourceHook) Run(e *zerolog.Event, level zerolog.Level, msg string) {
	if pc, file, line, ok := runtime.Caller(5); ok {
		funcName := runtime.FuncForPC(pc).Name()

		e.Str("source", fmt.Sprintf("%s:%v:%s", path.Base(file), line, path.Base(funcName)))
	}
}

type TimestampHook struct{}

func (h TimestampHook) Run(e *zerolog.Event, level zerolog.Level, msg string) {
	e.Time("timestampUTC", time.Now().UTC())
}

func (e *zerologEmitter) emit(level LogLevel, data logData) {
	zero := e.zerologger.
		Hook(SourceHook{}).
		Hook(TimestampHook{})
	event := zero.Info()
	if level == Debug {
		event = zero.Debug()
	}
	if level == Warn {
		event = zero.Warn()
	}
	if level == Error {
		event = zero.Error()
	}

	var appMetadata map[string]interface{}
	if data.appMetadata != nil {
		appMetadata = data.appMetadata
	} else {
		appMetadata = map[string]interface{}{}
	}

	metadataBytes, err := encodeData(appMetadata)
	if err != nil {
		metadataEncodingErr := map[string]string{"unmarshal.error": err.Error()}
		metadataBytes, _ = json.Marshal(metadataEncodingErr)
	}

	if data.exception != nil {
		event.Err(data.exception)
	}

	entry := event.
		Str("appID", data.appID).
		Str("appVersion", data.appVersion).
		Str("foo", "bar").
		Str("message", data.message).
		RawJSON("appMetadata", metadataBytes)
	entry.Send()
}

func encodeData(data map[string]interface{}) ([]byte, error) {
	return json.Marshal(data)
}

func shallowMergeMaps(a, b map[string]interface{}) map[string]interface{} {
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
