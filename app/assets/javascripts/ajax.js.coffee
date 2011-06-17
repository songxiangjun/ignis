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
    @interval = 7 * 1000
    @pollUri = '/poll'
    @timer = null
    @self = this
    
  successCallback: (response) ->
    json = Ext.JSON.decode response.responseText

    if json.messages isnt undefined
      for room, messages of json.messages
        window.rc.displayMessages room, messages

    if json.users isnt undefined
      Ext.getCmp('activeusers').setText(json.users)
      
    window.recentTime = json.time
    
  setTimer: ->
    @timer = setTimeout @ns + ".doPoll()", @interval 
    
  doPoll: ->
    rooms = window.rc.getRoomIDs()

    if @timer isnt null
      clearTimeout @timer

    if rooms.length > 0
      Ext.Ajax.request 
        scope    : this
        url      : @pollUri
        success  : @self.successCallback
        callback : @self.setTimer
        params   :
          'time'    : window.recentTime
          'rooms[]' : rooms
    else
      @self.setTimer()


window.poller = new PollingCommunicator 'window.poller'
