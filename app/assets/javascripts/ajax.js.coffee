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
  el = Ext.getCmp 'messages'
  json = Ext.JSON.decode response.responseText
  # el.body.insert "afterEnd", json.html
  el.update(json.html)
  el.body.scroll 'b', 100000, false

setTimerFn = ->
  window.timer = setTimeout window.pollFn, interval

window.pollFn = ->
  if window.timer isnt null
    window.timer = null
    Ext.Ajax.request
      url: pollUri
      params:
        time: recentTime
      success: responseFn
      callback: setTimerFn

window.pollFn()


