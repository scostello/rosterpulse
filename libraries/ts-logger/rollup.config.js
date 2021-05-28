import nodePolyfills from 'rollup-plugin-node-polyfills';
import commonjs from '@rollup/plugin-commonjs';
import resolve from '@rollup/plugin-node-resolve';
import sourceMaps from 'rollup-plugin-sourcemaps';

const config = {
    external: ['colors/safe', 'logform', 'moment', 'winston'],
    input: 'src/index.ts',
    context: 'window',
    output: {
        name: 'index',
        file: 'index.es5.js',
        format: 'esm',
        globals: {
            'colors/safe': 'colors',
            logform: 'logform',
            moment: 'moment',
            winston: 'winston',
        },
        sourcemap: true,
    },
    plugins: [
      nodePolyfills(),
      resolve({ browser: true }),
      commonjs(),
      sourceMaps(),
    ],
};

export default config;
