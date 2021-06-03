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
Prism = require("prismjs")
# loadLanguages = require("prismjs/components/")
# loadLanguages(["coffee", "bash", "json", "livescript", "markdown", "nginx", "perl", "pug", "stylus"])

jars = []

############################################################
editormodule.initialize = ->
    log "editormodule.initialize"
    jar = CodeJar(editor, highlight)
    jar.onUpdate(codeUpdate)
    jars.push(jar)
    return
    

highlight = (editField) ->
    log "highlight"
    code = editField.textContent
    html = Prism.highlight(code, Prism.languages.javascript, 'javascript');
    log html
    editField.innerHTML = html
    return

codeUpdate = ->
    log "codeUpdate"
    return

module.exports = editormodule