if ("undefined" == typeof window.console) {
    window.console = {
        "assert": function() { },
        "count": function() { },
        "clear": function() { },
        "debug": function() { },
        "dir": function() { },
        "dirxml": function() { },
        "info": function() { },
        "error": function() { },
        "getFirebugElement": function() { },
        "group": function() { },
        "groupEnd": function() { },
        "groupCollapsed": function() { },
        "log": function() { },
        "notifyFirebug": function() { },
        "profile": function() { },
        "profileEnd": function() { },
        "time": function() { },
        "timeEnd": function() { },
        "trace": function() { },
        "warn": function() { },
        "userObjects": [],
        "element": {},
        "firebug": "foo"
    };
};