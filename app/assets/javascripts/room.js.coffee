

class RoomController
  constructor: ->
    @roomlist = {} # Each entry should be a hash of { id: tabId }
    @chatpad = 'chatpad'
  getRoomIDs: ->
    ids = for id, tabId of @roomlist
      id    
  createRoom: ->
  joinRoom: (id, name) ->
    pad = Ext.getCmp(@chatpad)
    
    newTab = 
      title  : name
      layout : 'border'
      room   : id
      items  : [ 
        { xtype  : 'chat.panel', region: 'center' }, # panel[room=x] > chat.panel
        {
          region : 'south'
          xtype  : 'chat.inputpanel'
          items  : [ { xtype: 'msgfield' }, { xtype: 'msgroomfield', value: id } ]
        }
      ]
    
    pad.insertItem(newTab)
    
    window.poller.doPoll()
    
window.rc = new RoomController