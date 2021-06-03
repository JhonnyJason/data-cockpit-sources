editormodule = {name: "editormodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["editormodule"]?  then console.log "[editormodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

CodeJar = require("codejar").CodeJar

jars = []

############################################################
editormodule.initialize = ->
    log "editormodule.initialize"
    jar = CodeJar(editor, highlight)
    jar.onUpdate(codeUpdate)
    jars.push(jar)
    return
    

highlight = ->
    log "highlight"
    return

codeUpdate = ->
    log "codeUpdate"
    return

module.exports = editormodule