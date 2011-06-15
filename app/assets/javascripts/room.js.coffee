
class RoomController
  constructor: ->
    @roomlist = {} # Each entry should be a hash of { id: name }
    @chatpad = 'chatpad'
    @historyUri = '/history'
    
  getRoomEl: (room) -> Ext.ComponentQuery.query('panel[room='+room+'] > chatpanel')[0]
  getTabEl: (room) -> Ext.ComponentQuery.query('panel[room='+room+']')[0]

  getRoomIDs: ->
    ids = for id, tabId of @roomlist
      id    
  displayMessages: (room, html) ->
    el = this.getRoomEl(room)
    el.body.insertHtml "beforeEnd", html
    el.body.scroll 'b', 100000, false
  setActiveRoom: (id) ->
    pad = Ext.getCmp @chatpad
    tab = this.getTabEl id
    pad.setActiveTab tab
    
  createTab: (id, name, closable) ->
    Ext.create 'Ext.panel.Panel', 
      title  : name
      layout : 'border'
      room   : id
      closable : closable
      items  : [ 
        { xtype  : 'chatpanel', region: 'center' }, 
        {
          region : 'south'
          xtype  : 'chat.inputpanel'
          items  : [ { xtype: 'msgfield' }, { xtype: 'msgroomfield', value: id } ]
        }
      ]
      
  roomExist: (id) ->
    if this.getRoomEl(id) isnt undefined
      true
    else
      false
    
  joinRoom: (id, name, closable) ->
    pad = Ext.getCmp @chatpad
    tab = this.createTab id, name, closable
    pad.add tab
    pad.setActiveTab tab
    this.getRoomHistory id
    @roomlist[id] = name
    
  getRoomHistory: (room) ->
    Ext.Ajax.request 
      scope    : this
      url      : @historyUri
      params   :
        'rooms[]' : room
      success  : (response) ->
        json = Ext.JSON.decode response.responseText
        if json.messages isnt undefined
          window.rc.displayMessages room, json.messages[room]

        window.poller.doPoll()

    
window.rc = new RoomController