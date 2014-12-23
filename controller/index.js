require('coffee-script/register');

module.export = controller = require('./lib');

if (require.main) {
  var debug = require('debug')('armada:controller'),
      port  = process.env.PORT || 3333;
  controller.listen(port, function () {
    debug('listening on http://0.0.0.0:' + port);
  });
}
