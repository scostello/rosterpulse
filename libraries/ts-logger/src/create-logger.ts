import { createWinstonLogger } from './factories';
import {
  createBaseFormatter,
  createCliFormatter,
  createJsonFormatter,
  Formatter,
} from './formatters';
import { IFluentLogger, FluentLogger } from './logger';
import { isProduction } from './utils';
import { basic } from './schemas';
import { LoggerParams, LoggerOpts, LoggerTransport } from './types';

const levels = {
  error: 0,
  warn: 1,
  info: 2,
  http: 3,
  verbose: 4,
  debug: 5,
  pretty: 6,
  silly: 7,
};

const colors = {
  error: 'red',
  warn: 'yellow',
  info: 'green',
  http: 'green',
  verbose: 'cyan',
  debug: 'blue',
  pretty: 'magenta',
  silly: 'magenta',
};

const formatterFor = (transport: LoggerTransport, env: string = 'development'): Formatter => {
  switch (transport.type) {
    case 'console':
      return isProduction(env)
        ? createJsonFormatter()
        : createCliFormatter({ colors });
    case 'stream':
    case 'file':
      return createJsonFormatter();
    default:
      return createJsonFormatter();
  }
}

const withFormat = () => (transport: LoggerTransport) => {
  const env = process.env.NODE_ENV || 'development';

  const format = transport?.opts?.format
    ? transport.opts.format
    : formatterFor(transport, env).format;

  return {
    ...transport,
    opts: {
      ...transport.opts,
      format,
    },
  };
};

const withLevel = (baseLevel: string) => (transport: LoggerTransport) => {
  const level = transport?.opts?.level
    ? transport.opts.level
    : baseLevel;

  return {
    ...transport,
    opts: {
      ...transport.opts,
      level,
    },
  };
};

const createLogger = (loggerParams: LoggerParams, opts?: LoggerOpts): IFluentLogger => {
  const baseFormatter = createBaseFormatter({
    schemaMapper: basic,
  });

  const level = opts?.level
    ? opts.level
    : 'silly';

  const transports = (opts?.transports || [])
    .concat({ type: 'console' })
    .map(withFormat())
    .map(withLevel(level));

  const logger = createWinstonLogger({
    baseFormatter,
    levels,
    level,
    transports,
  })

  return FluentLogger.create(logger, loggerParams);
};

export { createLogger };
