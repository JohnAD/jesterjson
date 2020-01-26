Introduction to jesterjson
==============================================================================
ver 1.0.0

.. image:: https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png
   :height: 34
   :width: 131
   :alt: nimble
   :target: https://nimble.directory/pkg/jesterjson

.. image:: https://repo.support/img/rst-banner.png
   :height: 34
   :width: 131
   :alt: repo.support
   :target: https://repo.support/gh/JohnAD/jesterjson

This is a plugin for the nim web
framework `Jester <https://github.com/dom96/jester>`__. It creates a JSON
object document and pre-embeds key information such as the request details.

HOW TO USE
==========

1. Include the plugin ``j <- jsonDefault()`` at the top of your main ``routes``
   or primary ``router``. This will enable the plugin for the whole web site.

2. In every route, the JsonNode variable created by the plugin is available.

EXAMPLE
=======

.. code:: nim

    import json
    import jester
    import jesterjson

    proc namePage(j: JsonNode): string =
      if j["request"]["params"].hasKey("name"):
        result = "Hello " & j["request"]["params"]["name"].getStr
      else:
        result = "Hello stranger"

    routes:
      plugin j <- jsonDefault()
      get "/test":                  # get http://127.0.0.1/test?name=Joe
        resp namePage(j)

HOW IT WORKS
============

A new JsonNode object is created and the following keys are setup in it:

* j["request"] contains a subset of the request variable. Specifically:

    * j["request"]["params"] is an object contains names/values of the parameters
    * j["request"]["port"] is an integer indicating the port the request came in on
    * j["request"]["host"] is a string of the host name used to make the request
    * j["request"]["secure"] is a boolean indicating HTTPS usage or not
    * j["request"]["path"] is a string of the requests URL path name
    * j["request"]["path"] is a string describing the request method (post, get, put, etc.)

* j["env"] is an object of the OS environment variables

* j["commandLineParams"] contains an array of the parameters passed to the server on startup




Table Of Contents
=================

1. `Introduction to jesterjson <https://github.com/JohnAD/jesterjson>`__
2. Appendices

    A. `jesterjson Reference <https://github.com/JohnAD/jesterjson/blob/master/docs/jesterjson-ref.rst>`__
