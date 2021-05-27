const { environment } = require('@rails/webpacker');
const WebpackDevServer = require('webpack-dev-server');

environment.plugins.append(
	"Provide", 
	new webpack.ProvidePlugin({
		$: "jquery",
		jQuery: "jquery",
		Popper: ["popper.js", "default"]
	})
);

module.exports = environment;
