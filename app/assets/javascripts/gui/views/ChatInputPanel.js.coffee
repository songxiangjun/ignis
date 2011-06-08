
Ext.define 'ignis.view.ChatInputPanel'
  extend : 'Ext.form.Panel'
  alias  : 'widget.chat.inputpanel'
  layout : 'anchor'
  defaultType: 'textfield'
  defaults:
    anchor: '100%'
  #contentEl : 'maininput'
  bodyPadding: 5
  url: '/message'
  items: [
    { emptyText: 'Message', name: 'content', allowBlank: false }
  ]
  buttons: [
    { text: 'Send Message', formBind: true, handler: Ext.emptyFn }
  ]
