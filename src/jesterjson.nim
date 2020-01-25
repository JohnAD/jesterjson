import times
import strutils
import json

import
  jester

## This is a plugin for the nim web
## framework `Jester <https://github.com/dom96/jester>`__. It creates a JSON
## object document and pre-embeds key information such as the request details.
##
## HOW TO USE
## ==========
##
## 1. Include the plugin ``j <- jsonDefault()`` at the top of your main ``routes``
##    or primary ``router``. This will enable the plugin for the whole web site.
##
## 2. In every route, the JsonNode variable created by the plugin is available.
##
## EXAMPLE
## =======
##
## .. code:: nim
##
##     import json
##     import jester
##     import jesterjson
##     
##     proc namePage(j: JsonNode): string =
##       if j["request"]["params"].hasKey("name"):
##         result = "Hello " & j["request"]["params"]["name"].getStr
##       else:
##         result = "Hello stranger"
##     
##     routes:
##       plugin j <- jsonDefault()
##       get "/test":                  # get http://127.0.0.1/test?name=Joe
##         resp namePage(j)
##
## HOW IT WORKS
## ============
##
## A new JsonNode object is created and the following keys are setup in it:
##
## * j["request"] contains a subset of the request variable. Specifically:
##
##     * j["request"]["params"] is an object contains names/values of the parameters
##     * j["request"]["port"] is an integer indicating the port the request came in on
##     * j["request"]["host"] is a string of the host name used to make the request
##     * j["request"]["secure"] is a boolean indicating HTTPS usage or not
##     * j["request"]["path"] is a string of the requests URL path name
##     * j["request"]["path"] is a string describing the request method (post, get, put, etc.)
##
## * j["env"] TBD (will eventually contain various environment variables)


proc jsonDefault_before*(request: Request, response: ResponseData): JsonNode =  #SKIP!
  # This is the "before" portion of the plugin. Do not run
  # this procedure directly, it is used by the plugin itself.
  result = newJObject()
  #
  # parse `request`
  #
  result["request"] = newJObject()
  result["request"]["params"] = newJObject()
  for k, v in request.params.pairs:
    result["request"]["params"][k] = newJString(v)
  result["request"]["port"] = newJInt(request.port)
  result["request"]["host"] = newJString(request.host)
  result["request"]["secure"] = newJBool(request.secure)
  result["request"]["path"] = newJString(request.path)
  case request.reqMeth:
  of HttpHead:
    result["request"]["reqMeth"] = newJString("head")
  of HttpGet:
    result["request"]["reqMeth"] = newJString("get")
  of HttpPost:
    result["request"]["reqMeth"] = newJString("post")
  of HttpPut:
    result["request"]["reqMeth"] = newJString("put")
  of HttpDelete:
    result["request"]["reqMeth"] = newJString("delete")
  of HttpTrace:
    result["request"]["reqMeth"] = newJString("trace")
  of HttpOptions:
    result["request"]["reqMeth"] = newJString("options")
  of HttpConnect:
    result["request"]["reqMeth"] = newJString("connect")
  of HttpPatch:
    result["request"]["reqMeth"] = newJString("patch")



proc jsonDefault_after*(request: Request, response: ResponseData, data: JsonNode) = #SKIP!
  # This is the "after" portion of the plugin. Do not run
  # this procedure directly, it is used by the plugin itself.
  discard