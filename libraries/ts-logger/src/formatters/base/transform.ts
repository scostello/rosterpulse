import {format, FormatWrap, TransformableInfo} from 'logform';

export type SchemaMapper<T> = (info: TransformableInfo) => T;

type Transformer = <T extends TransformableInfo>(mapper: SchemaMapper<T>) => FormatWrap;

export const transformInfoWith: Transformer = <T extends TransformableInfo>(mapper: SchemaMapper<T>) => format(mapper);
