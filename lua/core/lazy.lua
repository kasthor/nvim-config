local ensure_package_manager = require('utils.ensure_package_manager')
ensure_package_manager()

require('lazy').setup("plugins")
