import { identity } from '../utils';

type Painter = (message: string) => string;

type Bracket =
  | '[]'
  | '()'
  | '<>'
  | '{}';

const wrapIn = (bracket: Bracket) =>
  (message: string, paintFn?: Painter) => {
    const paint = paintFn || identity;
    if (bracket === '[]') {
      return `${paint('[')}${message}${paint(']')}`;
    }
    if (bracket === '()') {
      return `${paint('(')}${message}${paint(')')}`;
    }
    if (bracket === '<>') {
      return `${paint('<')}${message}${paint('>')}`;
    }
    if (bracket === '{}') {
      return `${paint('{')}${message}${paint('}')}`;
    }

    return message;
  }

interface Wrap {
  inCurlys(message: string, paint?: Painter): string;
  inParens(message: string, paint?: Painter): string;
  inSquares(message: string, paint?: Painter): string;
  inStabys(message: string, paint?: Painter): string;
}

const wrap: Wrap = {
  inCurlys: wrapIn('{}'),
  inParens: wrapIn('()'),
  inSquares: wrapIn('[]'),
  inStabys: wrapIn('<>'),
};

export { Bracket, Painter, Wrap, wrap };
