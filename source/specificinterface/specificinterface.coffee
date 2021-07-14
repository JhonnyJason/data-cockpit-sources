specificinterface = {}

############################################################
authenticationinterface  = require("./authenticationinterface")
Object.assign(specificinterface, authenticationinterface)

module.exports = specificinterface