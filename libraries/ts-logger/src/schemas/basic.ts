import { TransformableInfo } from 'logform';
import { isExceptionField } from '../utils';
import { LoggableMetrics, LoggableTypes } from '../types';

export interface JsonException {
  message: string;
  stack?: string;
}

export interface BasicLogInfo extends TransformableInfo {
  appID: string;
  appVersion: string;
  tracingID?: string;
  appMetadata?: Record<string, any>;
  exception?: string;
  jsonException?: JsonException;
  logLevel: string;
  logType: LoggableTypes;
  message: string;
  metadata?: Record<string, string>;
  metrics?: LoggableMetrics;
  schemaVersion: string;
  timestampUTC: string;
}

const basic = (info: TransformableInfo): BasicLogInfo => {
  const exceptionFields = isExceptionField(info?.err)
    ? { exception: info?.err?.stack, jsonException: info?.err }
    : {};

  return {
    ...info,
    ...exceptionFields,
    appID: info?.appID,
    appVersion: info?.appVersion,
    logLevel: info?.level.toUpperCase(),
    logType: info?.logType ? info.logType : 'unknown',
    message: info?.message,
    schemaVersion: info?.schemaVersion,
    timestampUTC: info?.timestamp,
  };
};

export { basic };
