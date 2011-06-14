

class RoomController
  constructor: ->
    @roomlist = {} # Each entry should be a hash of { id: tabId }
  getRoomIDs: ->
    ids = for id, tabId of @roomlist
      id    
  createRoom: ->
  joinRoom: ->
    
window.rc = new RoomController