const { environment } = require('@rails/webpacker')



// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')

environment.loaders.delete('nodeModules')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)



module.exports = environment
