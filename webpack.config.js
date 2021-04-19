// const VueLoaderPlugin = require('vue-loader/lib/plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const ManifestPlugin = require('webpack-manifest-plugin');
const path = require('path');

module.exports = {
  entry: {
    application: './app/javascript/packs/application.js' // path.resolve(__dirname, './app/javascript/packs/application.js')
  },
  output: {
    path: path.resolve(__dirname, 'public/packs'), // manifest の出る位置
    filename: '[name]-[hash].js',
  },
  devServer: {
    contentBase: path.join(__dirname, 'public/packs'),
  },
  module: {
    rules: [
      // {
      //   test: /\.vue$/,
      //   loader: 'vue-loader'
      // },
      {
        test: /\.(css|sass)$/,
        // exclude: /node_modules/, // 一時的にnpmのbootstrapを利用するためnode_modulesからインポートしている
        use: [
          MiniCssExtractPlugin.loader,
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
    // new VueLoaderPlugin(),
    new MiniCssExtractPlugin({
      filename: '[name]-[hash].css'
    }),
    new ManifestPlugin({
      publicPath: '/packs/',　// manifest 内でのpathの表記が変わる
      writeToFileEmit: true
    })
  ],
}
