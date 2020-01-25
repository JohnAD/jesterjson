plugin Reference
==============================================================================

The following are the references for JesterCookieMsgs plugin.



Plugins
=======


.. _jsonDefault.plugin:
jsonDefault
---------------------------------------------------------

    .. code:: nim

        jsonDefault*(): JsonNode =

    This is the psuedo-procedure to invoke to enable the library plugin.

    Once placed on the main router or ``routes``, the plugin is active on
    all page routes.

    It creates a new object variable that is available to all routes including
    any ``extend``-ed subrouters.
    
