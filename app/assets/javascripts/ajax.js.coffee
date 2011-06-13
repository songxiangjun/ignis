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
  json = Ext.JSON.decode response.responseText

  el = Ext.getCmp 'messagePanel'
  if json.html isnt undefined
    el.update json
  el.body.scroll 'b', 100000, false
  window.recentTime = json.time

setTimerFn = ->
  window.timer = setTimeout window.pollFn, interval

window.pollFn = ->
  if window.timer isnt null
    clearTimeout window.timer
  Ext.Ajax.request
    url: pollUri
    params:
      time: window.recentTime
    success: responseFn
    callback: setTimerFn

window.pollFn()


