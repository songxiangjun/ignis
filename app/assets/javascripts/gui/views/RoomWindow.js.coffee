joinButton = 
  text    : 'Join Room'
  icon    : '/assets/16x16/comment.png'
  handler : (b) -> 
    grid = b.up('window').down('gridpanel')
    room = grid.getSelectionModel().getSelection()[0].data
    if window.rc.roomExist room.id
      window.rc.setActiveRoom room.id
    else
      window.rc.joinRoom room.id, room.name, true
    

Ext.define 'ignis.view.RoomWindow'
  extend   : 'Ext.window.Window'
  alias    : 'widget.roompicker'
  layout   : 'fit'
  title    : 'Rooms'
  height   : 300
  width    : 500
  autoShow : true
  autoRender: true
  modal    : true
  tbar     : [ joinButton ]
  items    : 
    xtype    : 'grid'
    layout   : 'fit'
    border   : false
    singleSelect: true
    store    : Ext.data.StoreManager.lookup('rooms')
    columns  : [ 
      { header: 'Room Name',   dataIndex: 'name' }
      { header: 'Description', dataIndex: 'description', flex: 1 }
    ]
    