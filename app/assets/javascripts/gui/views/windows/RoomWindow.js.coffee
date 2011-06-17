joinButton = 
  text    : 'Join Room'
  icon    : '/assets/16x16/comment.png'
  handler : (b) -> 
    grid = b.up('gridpanel')
    room = grid.getSelectionModel().getSelection()[0].data
    if window.rc.roomExist room.id
      window.rc.setActiveRoom room.id
    else
      window.rc.joinRoom room.id, room.name, true
    

Ext.define 'ignis.view.RoomWindow'
  extend   : 'Ext.grid.Panel'
  alias    : 'widget.roompicker'
  title    : 'Rooms'
  layout   : 'fit'
  border   : false
  singleSelect: true
  viewConfig:
    emptyText: 'No rooms available.'
    deferEmptyText: false
  store    : Ext.data.StoreManager.lookup('rooms')
  columns  : [
    { header: 'Room Name',   dataIndex: 'name' }
    { header: 'Description', dataIndex: 'description', flex: 1 }
  ]
  tbar     : [ joinButton ]
