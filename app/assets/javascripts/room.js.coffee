class RoomController
  constructor: ->
    @roomlist = {} # Each entry should be a hash of { id: name }
    @chatpad = 'chatpad'
    @historyUri = window.link.history
    
  getRoomEl: (room) -> Ext.ComponentQuery.query('panel[room='+room+'] > chatpanel')[0]
  getTabEl: (room) -> Ext.ComponentQuery.query('panel[room='+room+']')[0]
  getActiveRoom: -> Ext.getCmp(@chatpad).getActiveTab().room
  removeRoom: (room) -> delete @roomlist[room]
  getRoomIDs: ->
    ids = for id, tabId of @roomlist
      id    
  displayMessages: (room, html) ->
    el = this.getRoomEl(room)
    el.body.insertHtml "beforeEnd", html
    el.body.scroll 'b', 100000, false
    if ""+room != ""+this.getActiveRoom()
      roomEl = this.getTabEl(room)
      roomEl.tab.setIcon('/assets/16x16/comment_add.png')
      roomEl.tab.ownerCt.doLayout()
  setActiveRoom: (id) ->
    pad = Ext.getCmp @chatpad
    tab = this.getTabEl id
    pad.setActiveTab tab
    
  createTab: (id, name, closable) ->
    panel = Ext.create 'Ext.panel.Panel', 
      title    : name
      layout   : 'border'
      room     : id
      closable : closable
      items    : [ 
        { region: 'center', xtype: 'chatpanel' }
        { region: 'south',  xtype: 'chat.inputpanel', items: [ 
          { xtype: 'msgfield' }, { xtype: 'msgroomfield', value: id } 
        ]}
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
        window.rc.displayMessages room, response.responseText
        window.poller.doPoll()

window.rc = new RoomController