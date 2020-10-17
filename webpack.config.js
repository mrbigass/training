const VueLoaderPlugin = require('vue-loader/lib/plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const ManifestPlugin = require('webpack-manifest-plugin');
const path = require('path');

module.exports = {
  entry: {
    application: './app/javascript/packs/application.js' // path.resolve(__dirname, './app/javascript/packs/application.js')
  },
  output: {
    path: path.resolve(__dirname, './public/assets'),
    filename: 'javascripts/[name]-[hash].js',
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.(css|sass)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: path.resolve(__dirname, 'public/packs/stylesheets')
            }
          },
          // 'vue-style-loader',
          'css-loader',
          'sass-loader'
        ]
      },
      {
        test: /\.(jpg|png|gif)$/,
        use: [{
          loader: 'file-loader',
          options: {
            outputPath: 'images',
            publicPath: 'assets/images',
            name: '[name].[ext]'
          }
        }]
      }
    ]
  },
  plugins: [
    new VueLoaderPlugin(),
    new MiniCssExtractPlugin({
      filename: 'stylesheets/[name]-[hash].css'
    }),
    new ManifestPlugin()
  ],
}