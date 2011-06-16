
Ext.define 'ignis.view.MessageField'
  extend    : 'Ext.form.field.Text'
  alias     : 'widget.msgfield'
  emptyText : 'Type a message and hit enter to send...'
  name      : 'message[content]'
  anchor    : '100%'
  height    : 20
  tabIndex  : 1
  
Ext.define 'ignis.view.MessageRoomField'
  extend   : 'Ext.form.field.Hidden'
  alias    : 'widget.msgroomfield'
  name     : 'message[room_id]'

Ext.define 'ignis.view.ChatInputPanel'
  extend      : 'Ext.form.Panel'
  alias       : 'widget.chat.inputpanel'
  layout      : 'anchor'
  border      : false
  bodyPadding : 5
  url         : '/message'
  height      : 32
  defaults    :
    border      : false
