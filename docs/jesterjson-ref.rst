jesterjson Reference
==============================================================================

The following are the references for jesterjson.






Procs, Methods, Iterators
=========================


.. _jsonDefault.p:
jsonDefault
---------------------------------------------------------

    .. code:: nim

        proc jsonDefault*(request: Request, response: ResponseData): JsonNode =

    source line: `68 <../src/jesterjson.nim#L68>`__

    This is the psuedo-procedure to invoke to enable the library plugin.
    
    Once placed on the main router or ``routes``, the plugin is active on
    all page routes.
    
    It creates a new object variable that is available to all routes including
    any ``extend``-ed subrouters.







Table Of Contents
=================

1. `Introduction to jesterjson <https://github.com/JohnAD/jesterjson>`__
2. Appendices

    A. `jesterjson Reference <jesterjson-ref.rst>`__
