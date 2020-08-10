const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const webpack = require('webpack')
const WebpackDevServer = require('webpack-dev-server')

environment.loaders.prepend('coffee', coffee)
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',

  }))
module.exports = environment
