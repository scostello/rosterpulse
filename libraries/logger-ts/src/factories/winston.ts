import { Format } from 'logform';
import {
  createLogger,
  Logger,
  LoggerOptions,
  transports as winstonTransports,
} from 'winston';
import { LoggerTransport } from '../types';

export interface WinstonLoggerOpts extends Omit<LoggerOptions, 'transports'> {
  baseFormatter: { type: string; format: Format; };
  level: string;
  transports?: LoggerTransport[];
}

const withWinstonTransport = (transport: LoggerTransport) => {
  switch (transport.type) {
    case 'console':
      return new winstonTransports.Console(transport.opts);
    case 'file':
      return new winstonTransports.File(transport.opts);
    case 'stream':
      return new winstonTransports.Stream(transport.opts);
    default:
      return new winstonTransports.Console(transport.opts);
  }
};


const createTransports = (transports: LoggerTransport[]) =>
  transports.map(withWinstonTransport);

type WinstonLoggerFactory = (options: WinstonLoggerOpts) => Logger;

const createWinstonLogger: WinstonLoggerFactory = (options: WinstonLoggerOpts) => {
  const { baseFormatter, level, ...rest } = options;

  return createLogger({
    ...rest,
    format: baseFormatter.format,
    level,
    transports: createTransports(options?.transports || []),
  });
};

export { createWinstonLogger };
