#sendButton =
#  xtype: 'button'
#  text: 'Send Message'
#  anchor: '96%'
#  id: 'msgBtn'
#
#buttonColumn =
#  columnWidth: .1
#  layout: 'anchor'
#  items: [ sendButton ]

messageField =
  xtype     : 'textfield'
  emptyText : 'Type a message...'
  name      : 'content'
  anchor    : '100%'
  id        : 'msgfield'

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
  height      : 32
  defaults    :
    border      : false
  items       : [ messageColumn ]
