import { format, Format, TransformableInfo } from 'logform';
import { transformInfoWith } from './transform';
import { datetime } from '../../utils';

export interface BaseFormatOpts<T extends TransformableInfo = TransformableInfo> {
  schemaMapper: (info: T) => T;
}

export const createBaseFormat = (opts: BaseFormatOpts): Format => {
  const toSchema = opts?.schemaMapper
    ? transformInfoWith(opts.schemaMapper)
    : transformInfoWith((info) => info);

  return format.combine(
      format.timestamp({
        format: datetime.default(),
      }),
      toSchema(),
  );
};

