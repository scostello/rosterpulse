import {
  Logger,
  LoggableMetrics,
  LoggableMetricValue,
  LoggableTypes,
} from '../types';

export type LoggerFields = Record<string, any>;

export type LogMessageFn = (message: string) => IFluentLogger;

export interface LoggerLevels {
  debug: LogMessageFn;
  error: LogMessageFn;
  info: LogMessageFn;
  pretty: LogMessageFn;
  silly: LogMessageFn;
  verbose: LogMessageFn;
  warn: LogMessageFn;
}

export interface IFluentLogger extends LoggerLevels {
  asType(logType: LoggableTypes): IFluentLogger;
  withError(error: Error): IFluentLogger;
  withFields(fields: LoggerFields): IFluentLogger;
  withField(field: string, value: any): IFluentLogger;
  withMetadata(metadata: LoggerFields): IFluentLogger;
  withMetric(name: string, metric: LoggableMetricValue): IFluentLogger;
  withMetrics(metric: LoggableMetrics): IFluentLogger;
  withScope(scope: string): IFluentLogger;
  withTracingId(tracingID: string): IFluentLogger;
}

export class FluentLogger implements IFluentLogger {
  private readonly _logger: Logger;

  private readonly _fields: LoggerFields;

  private constructor(logger: Logger, fields: LoggerFields = {}) {
    this._logger = logger;
    this._fields = fields;
  }

  public static create(logger: Logger, fields?: LoggerFields) {
    return new FluentLogger(logger, fields);
  }

  private _log(level: string, message: string) {
    this._logger.log({
      ...this._fields,
      level,
      message
    });

    return this;
  }

  asType(logType: LoggableTypes) {
    return this.withFields({ logType });
  }

  debug(message: string) {
    return this._log('debug', message);
  }

  error(message: string) {
    return this._log('error', message);
  }

  info(message: string) {
    return this._log('info', message);
  }

  pretty(message: string) {
    return this._log('pretty', message);
  }

  silly(message: string) {
    return this._log('silly', message);
  }

  verbose(message: string) {
    return this._log('verbose', message);
  }

  warn(message: string) {
    return this._log('warn', message);
  }

  withError(error: Error) {
    const errorObj = error as { [key: string]: any };
    const err = Object
      .getOwnPropertyNames(errorObj)
      .reduce((acc, propName) => ({
        ...acc,
        [propName]: errorObj[propName],
      }), {} as Record<string, any>);

    return this.withFields({ err });
  }

  withField(key: string, value: any) {
    return this.withFields({ [key]: value });
  }

  withFields(fields: LoggerFields) {
    return FluentLogger.create(this._logger, {
      ...this._fields,
      ...fields,
    });
  }

  withMetadata(metadata: LoggerFields) {
    return this.withFields({ appMetadata: { ...metadata } });
  }

  withMetric(name: string, metric: LoggableMetricValue) {
    return this.withMetrics({ [name]: metric });
  }

  withMetrics(metrics: LoggableMetrics) {
    const fields = this._fields || {};

    return this.withFields({
      metrics: {
        ...(fields?.metrics || {}),
        ...metrics,
      },
    });
  }

  withScope(scope: string) {
    return this.withFields({ scope });
  }

  withTracingId(tracingID: string): IFluentLogger {
    return this.withFields({ tracingID });
  }
}