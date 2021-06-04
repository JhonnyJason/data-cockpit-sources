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
## mass require attempt
require("prismjs/components/prism-coffeescript")
require("prismjs/components/prism-bash")
require("prismjs/components/prism-json")
require("prismjs/components/prism-livescript")
require("prismjs/components/prism-markdown")
require("prismjs/components/prism-nginx")
require("prismjs/components/prism-perl")
require("prismjs/components/prism-pug")
require("prismjs/components/prism-stylus")

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
    # html = Prism.highlight(code, Prism.languages.javascript, 'javascript');
    html = Prism.highlight(code, Prism.languages.coffeescript, 'coffeescript');
    log html
    editField.innerHTML = html
    return

codeUpdate = ->
    log "codeUpdate"
    return

module.exports = editormodule