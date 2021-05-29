import path from 'path';
import HtmlWebpackPlugin from 'html-webpack-plugin';
import { Configuration, WebpackOptionsNormalized } from 'webpack';

const cwd = path.resolve(process.env.RUNFILES, 'bluebeam/clients/web-rosterpulse');

const babelLoaderConfig = () => ({
  loader: 'babel-loader',
  options: {
    plugins: [
      ['@babel/plugin-transform-typescript', { allowDeclareFields: true }],
      '@babel/plugin-syntax-dynamic-import',
      '@babel/plugin-proposal-class-properties',
      '@babel/plugin-proposal-object-rest-spread',
      '@babel/plugin-proposal-optional-chaining',
    ],
    presets: [
      '@babel/preset-typescript',
      '@babel/preset-react',
    ],
  },
});

const isProduction = (mode: WebpackOptionsNormalized['mode']) => mode === 'production';

const devServer = (): WebpackOptionsNormalized['devServer'] => ({
  // hot: true,
  historyApiFallback: true,
  open: true,
  port: 3000,
  contentBase: path.resolve(cwd, 'dist'),
});

function configFactory(env: { [key: string]: string }, argv: WebpackOptionsNormalized) {
  const mode = argv.mode || 'development';
  return {
    devServer: isProduction(mode) ? {} : devServer(),
    devtool: isProduction(mode) ? 'source-map' : 'eval-source-map',
    entry: [path.resolve(cwd, 'src/index.tsx')],
    mode,
    module: {
      rules: [
        {
          include: path.resolve(cwd, 'src'),
          test: /\.(mjs|js|jsx|ts|tsx)/,
          use: [babelLoaderConfig()],
        },
        {
          test: /\.css$/,
          exclude: /node_modules/,
          use: ['style-loader', 'css-loader'],
        },
        {
          test: /\.(png|svg|jpg|gif|mp4|webm)$/,
          use: ['file-loader'],
        },
      ]
    },
    output: {
      filename: isProduction(mode) ? '[name].[contenthash].js' : 'bundle.js',
      path: path.resolve(cwd, 'dist'),
      publicPath: '/',
    },
    plugins: new HtmlWebpackPlugin({
      title: 'Rosterpulse',
      template: path.join(cwd, 'config/index.html.ejs'),
    }),
    target: ['web', 'es5'],
  };
}

export default configFactory;
