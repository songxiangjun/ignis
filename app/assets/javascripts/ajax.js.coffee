# This file is for all ajax chat communications.

# this section sets up any extra features surrounding all requests and responses.
completeFn = ->
  Ext.emptyFn()
Ext.Ajax.on 'requestComplete', completeFn

exceptionFn = ->
  Ext.emptyFn()
Ext.Ajax.on 'requestException', exceptionFn

# this section is for the actual ajax chat windows
interval = 10 * 1000
pollUri = '/poll'

responseFn = (response) ->
  #  json = Ext.JSON.decode response.responseText
  Ext.getCmp('messages').update(response.responseText)

setTimerFn = ->
  timer = setTimeout pollFn, interval

pollFn = ->
  Ext.Ajax.request
    url: pollUri
    params:
      time: recentTime
    success: responseFn
    callback: setTimerFn

pollFn()


