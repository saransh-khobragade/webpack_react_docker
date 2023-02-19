const common = require("./webpack.common");
const { merge } = require("webpack-merge");
var HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = merge(common, {
  mode: "development",
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/index.html"
    })
  ],
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          "style-loader", //3. Inject styles into DOM
          "css-loader", //2. Turns css into commonjs
          "sass-loader" //1. Turns sass into css
        ]
      }
    ]
  },
  devtool: "source-map",
  stats: {
    preset: "minimal",
    assets: false,
    builtAt: true,
    chunks: true,
    errors: true,
    errorDetails: true,
    errorStack: true,
    env: false,
    outputPath: false,
    publicPath: false,
    entrypoints: false,
    chunkGroups: false,
    modules: false,
    children: false,
    logging: false,
    loggingTrace: false,
    warnings: false,
    moduleTrace: false,
    errorsCount: false,
    warningsCount: false,
    timings: false,
    version: false,
    hash: false,
    logging:'none'
  }
});