import colors from 'colors/safe';
import { Colorizer, Format, format, TransformableInfo } from 'logform';
import { Painter, wrap } from '../decorations';
import { isExceptionField } from '../../utils';

const isPretty = (level: string) => level === 'pretty';

const formatAs = (formatType?: 'pretty' | 'standard') =>
  (fields: Record<string, any>, paint: Painter) => {
    if (formatType === 'pretty') {
      return (acc: string, key: string) => `${acc}\n${paint(key)}=${JSON.stringify(fields[key], null, 2)}`
    }

    return (acc: string, key: string) => `${acc}    ${paint(key)}=${JSON.stringify(fields[key])}`;
  }

type FieldReducer = (previousValue: string, currentValue: string, currentIndex: number, array: string[]) => string;

const formatEntryFields = (reducer: FieldReducer, fields: Record<string, any>): string => {
  const {
    err,
    ...rest
  } = fields;

  const lastEntry = isExceptionField(err)
    ? `\n${colors.underline(colors.red('err'))}={\n"name": "${err.name}",\n"message": "${err.message}",\n"stack": "${err.stack}"\n}`
    : '';

  const entryFields = Object
    .keys(rest)
    .reduce(reducer, '');

  return `${entryFields}${lastEntry}`;
}

const colorFormatWith = (colorizer: Colorizer) => {
  const levelPadding = 6;
  const messagePadding = 115;

  const colorizeFor = (level: string) => (message: string) => colorizer.colorize(level, message);

  return (info: TransformableInfo) => {
    const {
      appID,
      appVersion,
      scope,
      level,
      message,
      timestamp,
      ...restFields
    } = info;

    const colorize = colorizeFor(level);
    const appMessage = colors.cyan(`${appID}@${appVersion}`);
    const scopeMessage = scope ? ` ${wrap.inParens(colors.cyan(scope), colors.yellow)}` : '';
    const levelMessage = colorize(level.substr(0, levelPadding).padEnd(levelPadding));
    const logMessage = colors.bold(colors.italic(message));

    const entryHandle = [
      timestamp.toString(),
      colorize(levelMessage),
      wrap.inSquares(`${appMessage}${scopeMessage}`, colors.yellow),
      logMessage,
    ].join(' ');

    const formatWith = formatAs(isPretty(level) ? 'pretty' : 'standard');
    const entryFields = formatEntryFields(formatWith(restFields, colorize), restFields);
    return `${entryHandle.padEnd(messagePadding)} ${entryFields}`;
  };
};

interface CliFormatOpts {
  colors: Record<string, string>;
}

type CliFormatFactory = (opts: CliFormatOpts) => Format;

const createCliFormat: CliFormatFactory = (opts: CliFormatOpts) => {
  const colorizer = format.colorize({ colors: opts.colors });
  return format.printf(colorFormatWith(colorizer));
};

export {
  colorFormatWith,
  createCliFormat,
}
