sendButton = 
  xtype: 'button'
  text: 'Send Message'
  handler: Ext.emptyFn
  anchor: '96%'
  
buttonColumn = 
  columnWidth: .1
  layout: 'anchor'
  items: [ sendButton ]

messageField = 
  xtype: 'textfield'
  emptyText: 'Message'
  name: 'content'
  allowBlank: false
  anchor: '98%'
  
messageColumn = 
  columnWidth: .9
  layout: 'anchor'
  items: [ messageField ]

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
  items       : [ messageColumn, buttonColumn ]
