

messageField =
  xtype          : 'textareafield'
  emptyText      : 'Type a message and hit enter to send...'
  name           : 'content'
  anchor         : '100%'
  height         : 40
  id             : 'msgfield'
  tabIndex       : 1
  enterIsSpecial : true

messageColumn =
  columnWidth : 1
  layout      : 'anchor'
  items       : [ messageField ]

Ext.define 'ignis.view.ChatInputPanel'
  extend      : 'Ext.form.Panel'
  alias       : 'widget.chat.inputpanel'
  layout      : 'column'
  border      : false
  bodyPadding : 5
  url         : '/message'
  height      : 52
  defaults    :
    border      : false
  items       : [ messageColumn ]
