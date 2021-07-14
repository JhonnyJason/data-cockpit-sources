configmodule = {name: "configmodule", uimodule: false}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["configmodule"]?  then console.log "[configmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

########################################################
state = null

########################################################
configmodule.initialize = ->
    log "configmodule.initialize"
    state = allModules.statemodule

    global.interfaceServers = configmodule.interfaceServers
    state.addOnChangeListener("dataManagerURL", syncDataManagerURLFromState)
    return    

############################################################
syncDataManagerURLFromState = ->
    log "syncDataManagerURLFromState"
    dataManagerURL = state.load("dataManagerURL")
    interfaceServers.authenticationinterface = dataManagerURL
    return    

########################################################
#region interfaceConfiguration
interfaceServers = {
    authenticationinterface: "https://data.extensivlyon.coffee"
}

#endregion

########################################################
#region exposedProperties
configmodule.prop = true

#endregion

export default configmodule
