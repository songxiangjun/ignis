getGridSelection = (b) ->
  grid = b.up('gridpanel')
  room = grid.getSelectionModel().getSelection()[0].data


refreshButton = 
  text    : 'Refresh'
  icon    : '/assets/16x16/process.png'
  handler : (b) -> b.up('gridpanel').getStore().load()
joinButton = 
  text    : 'Join Room'
  icon    : '/assets/16x16/comment.png'
  handler : (b) -> 
    room = getGridSelection b
    window.rc.joinRoom room.id, room.name


Ext.define 'ignis.view.RoomListWindow'
  extend   : 'Ext.window.Window'
  alias    : 'widget.roomlistwindow'
  title    : 'Administer Rooms'
  layout   : 'fit'
  width    : 600
  height   : 300
  autoShow : true
  items    :
    xtype        : 'gridpanel'
    border       : false
    singleSelect : true
    store        : Ext.data.StoreManager.lookup('rooms')
    tbar         : [ refreshButton, joinButton ]
    viewConfig   :
      emptyText      : 'No rooms that you have access to were found.'
      deferEmptyText : false
    columns      : [
      { header: 'Room Name',        dataIndex: 'name' }
      { header: 'Group Membership', dataIndex: 'group_name' }
      { header: 'Description',      dataIndex: 'description', flex: 1 }
    ]
    listeners    :
      add          : (that, opts) -> that.getStore().load()
