submitRoom = (b) ->
  values = b.up('form').getValues()
  Ext.Ajax.request 
    scope    : this
    url      : window.link.rooms
    success  : (response) -> b.up('window').close()
    params   : values

Ext.define 'ignis.view.RoomAddWindow',
  extend   : 'Ext.window.Window'
  alias    : 'widget.roomaddwindow'
  title    : 'Create Room'
  layout   : 'fit'
  width    : 400
  modal    : true
  autoShow : true
  items    :
    xtype       : 'form'
    url         : window.link.rooms
    defaultType : 'textfield'
    frame       : true
    padding     : 5
    defaults    :
      anchor      : '100%'
      allowBlank  : false
    items       : [
      { fieldLabel : 'Group',       name: 'group',             xtype: 'groupcombobox'}
      { fieldLabel : 'Name',        name: 'room[name]' }
      { fieldLabel : 'Description', name: 'room[description]' }
    ]
    buttons     : [ 
      { text: 'Submit Room', handler: submitRoom } 
    ]