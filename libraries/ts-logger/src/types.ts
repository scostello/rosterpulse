import * as winston from 'winston';

export interface Logger extends winston.Logger {}

export type ConsoleTransportOptions = winston.transports.ConsoleTransportOptions;
export type ConsoleTransportInstance = winston.transports.ConsoleTransportInstance;

export type FileTransportOptions = winston.transports.FileTransportOptions;
export type FileTransportInstance = winston.transports.FileTransportInstance;

export type StreamTransportOptions = winston.transports.StreamTransportOptions;
export type StreamTransportInstance = winston.transports.StreamTransportInstance;

export interface WinstonTransports {
  console(opts?: ConsoleTransportOptions): ConsoleTransportInstance;
  file(opts?: FileTransportOptions): FileTransportInstance;
  stream(opts?: StreamTransportOptions): StreamTransportInstance;
}

export interface LoggerParams {
  appID: string;
  appVersion: string;
  schemaVersion: string;
}

export interface LoggerTransport<T = WinstonTransports> {
  type: keyof T;
  opts?: any;
}

export interface LoggerOpts {
  level?: string;
  transports?: LoggerTransport[];
}

export type LoggableTypes =
  | 'event'
  | 'metric'
  | 'request'
  | 'trace'
  | 'unknown';

export interface LoggableMetricValue {
  unit: string;
  value: number;
}

export type LoggableMetrics = { [metricName: string]: LoggableMetricValue };
