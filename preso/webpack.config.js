const webpack = require ('webpack');
const HtmlWebpackPlugin = require ('html-webpack-plugin');
const CopyWebpackPlugin = require ('copy-webpack-plugin');
const path = require ('path');

const ExtractTextPlugin = require ('extract-text-webpack-plugin');
const precss = require ('precss');
const autoprefixer = require ('autoprefixer');
let node_modules_path = path.resolve (__dirname, './', 'node_modules');

const env = process.env.NODE_ENV || 'development';
const dev = env === 'development';

const extractSassPluginConfig = new ExtractTextPlugin ({
  filename: 'style.css',
});

const ProvidePluginConfig = new webpack.ProvidePlugin ({
  $: 'jquery',
  jQuery: 'jquery',
  Reveal: 'reveal.js',
});

const PLUGINS = [
  new HtmlWebpackPlugin ({
    template: './index.html',
    files: {
      js: [path.join (node_modules_path, 'reveal.js/lib/js/head.min.js')],
    },
  }),
  new CopyWebpackPlugin ([
    { from: { glob: 'content/**/*'}},
    { from: { glob: path.join(node_modules_path, 'reveal.js/css/print/*.css') }, to: 'lib/css/[name].css' },
    { from: { glob: path.join(node_modules_path, 'reveal.js') }, to: 'node_modules/reveal.js'},
  ]),
  extractSassPluginConfig,
  // new webpack.ProvidePlugin({
  //   head: 'reveal.js/lib/js/head.min.js'
  // }),
  ProvidePluginConfig,
  // new MiniCssExtractPlugin({
  //   // Options similar to the same options in webpackOptions.output
  //   // both options are optional
  //   filename: "[name].css",
  //   chunkFilename: "[id].css"
  // })
];

if (dev) {
  PLUGINS.push (new webpack.HotModuleReplacementPlugin ());
}

module.exports = {
  context: path.join (__dirname, 'src'),
  entry: {
    vendor: [
      path.join (node_modules_path, 'reveal.js/lib/js/head.min.js'),
      path.join (node_modules_path, 'reveal.js/js/reveal.js'),
      // path.join(node_modules_path, 'mathjax/latest.js'),
      // path.join(node_modules_path, 'mathjax/extensions/MathMenu.js'),
      // path.join(node_modules_path, 'mathjax/extensions/MathZoom.js'),
    ],
    config: './js/config.js',
    app: './js/main.js',
  },
  output: {
    path: path.join (__dirname, 'dist'),
    publicPath: dev ? 'http://localhost:8081/' : '/',
    filename: '[name].[hash].js',
  },
  resolve: {
    alias: {
      nodePath: path.join(__dirname, 'node_modules'),
    }
  },
  // externals: {
  //   'reveal': 'Reveal',
  //   'head': 'head.js'
  // },
  module: {
    loaders: [
      // { test: /\.css$/, loaders: ['style', 'css'] },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loaders: ['babel-loader'],
      },
      {test: /\.json$/, loaders: ['json-loader']},
      {test: /\.(eot|svg|ttf|woff|woff2)$/, loaders: ['file-loader']},
      {
        test: /\.(png|mov|mp4)$/,
        include: path.join (__dirname, 'src'),
        use: [{loader: 'file-loader'}],
      },
      {
        test: /\.(scss|css)$/,
        exclude: '/node_modules/',
        use: ExtractTextPlugin.extract ({
          fallback: [
            {
              loader: 'style-loader',
            },
          ],
          use: [
            {
              loader: 'css-loader',
            },
            {
              loader: 'postcss-loader',
            },
            {
              loader: 'sass-loader',
              options: {
                includePaths: [node_modules_path, path.join (__dirname, 'src')],
              },
            },
          ],
        }),
      },
    ],
  },
  plugins: PLUGINS,
  devServer: {
    contentBase: path.join(__dirname, "dist/"),
    noInfo: true,
    port: 8081
  }
};
