import { Format, TransformableInfo } from 'logform';
import { createBaseFormat } from './base';
import { createCliFormat } from './cli';
import { createJsonFormat } from './json';

export type FormatterType = 'base' | 'cli' | 'json';

export interface Formatter {
  format: Format,
  type: FormatterType,
}

interface CliFormatterOpts {
  colors: Record<string, string>;
}

export interface BaseFormatterOpts<T extends TransformableInfo = TransformableInfo> {
  schemaMapper: (info: T) => T;
}

const createBaseFormatter = (opts: BaseFormatterOpts): Formatter => ({
  format: createBaseFormat(opts),
  type: 'base',
});

const createCliFormatter = (opts: CliFormatterOpts): Formatter => ({
  format: createCliFormat(opts),
  type: 'cli',
});

const createJsonFormatter = (): Formatter => ({
  format: createJsonFormat(),
  type: 'json',
});

export {
  createBaseFormatter,
  createCliFormatter,
  createJsonFormatter,
};
