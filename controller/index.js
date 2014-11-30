require('coffee-script/register');
var debug = require('debug')('armada:controller'),
    pkg   = require('./package.json');

module.export = controller = require('./lib');

if (require.main) {
  var port = process.env.PORT || 3333;
  controller.listen(port, function () {
    debug(pkg.name + ' is listening on http://0.0.0.0:' + port);
  });
}
