
class RoomController
  constructor: ->
    @roomlist = {} # Each entry should be a hash of { id: name }
    @chatpad = 'chatpad'
    @historyUri = '/history'
    
  getRoomIDs: ->
    ids = for id, tabId of @roomlist
      id    
  displayMessages: (room, html) ->
    el = Ext.ComponentQuery.query('panel[room='+room+'] > chatpanel')[0]
    console.log el
    el.body.insertHtml "beforeEnd", html
    el.body.scroll 'b', 100000, false
    
  createTab: (id, name) ->
    tabConfiguration = 
      title  : name
      layout : 'border'
      room   : id
      items  : [ 
        { xtype  : 'chatpanel', region: 'center', id: 'mtest' }, 
        {
          region : 'south'
          xtype  : 'chat.inputpanel'
          items  : [ { xtype: 'msgfield' }, { xtype: 'msgroomfield', value: id } ]
        }
      ]
      
  joinRoom: (id, name) ->
    Ext.getCmp(@chatpad).add(this.createTab(id, name))
    this.getRoomHistory()
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
          for room, messages of json.messages
            window.rc.displayMessages room, messages

        window.poller.doPoll()

    
window.rc = new RoomController