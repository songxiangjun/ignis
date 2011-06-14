# This file is for all ajax chat communications.

# this section sets up any extra features surrounding all requests and responses.
completeFn = ->
  Ext.emptyFn()
Ext.Ajax.on 'requestComplete', completeFn

exceptionFn = ->
  Ext.emptyFn()
Ext.Ajax.on 'requestException', exceptionFn



# This SINGLETON class is responsible for all polling communication. 
# Note that there are some weird scoping issues due to the callbacks needed in the poller.

class PollingCommunicator

  constructor: (@ns) ->
    @interval = 10 * 1000
    @pollUri = '/poll'
    @timer = null
    @self = this
    
  successCallback: (response) ->
    json = Ext.JSON.decode response.responseText
    el = Ext.getCmp 'messagePanel'
    if json.html isnt undefined
      el.update json
      el.body.scroll 'b', 100000, false
    window.recentTime = json.time
    
  setTimer: ->
    @timer = setTimeout @ns + ".doPoll()", @interval 
    
  doPoll: ->
    if @timer isnt null
      clearTimeout @timer
    Ext.Ajax.request 
      scope: this
      url: @pollUri
      params:
        time: window.recentTime
        rooms: window.rc.getRoomIDs()
      success: @self.successCallback
      callback: @self.setTimer

window.poller = new PollingCommunicator 'window.poller'
