completeFn = ->
  emptyFn()
Ext.Ajax.on 'requestComplete', completeFn

exceptionFn = ->
  emptyFn()
Ext.Ajax.on 'requestException', exceptionFn
