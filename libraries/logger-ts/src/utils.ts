import moment from 'moment';

const identity = <T>(id: T) => id;

const isProduction = (env: string) => env === 'production';

const isExceptionField = (err: Record<string, any>) => Boolean(err?.message) && Boolean(err?.stack);

const DefaultDateTimeFormat = 'YYYY-MM-DDTHH:mm:ss.SSSSSSSS';

const datetime = {
  DefaultDateTimeFormat,
  default: () => moment.utc(moment.now()).format(DefaultDateTimeFormat),
  format: (format: string = DefaultDateTimeFormat) => moment.utc(moment.now()).format(format),
};

export {
  datetime,
  identity,
    isExceptionField,
    isProduction,
};
