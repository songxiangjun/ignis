Ext.define 'ignis.view.ChatInputPanel'
  extend : 'Ext.panel.Panel'
  alias  : 'widget.chat.inputpanel'
  layout : 'anchor'
  defaultType: 'textfield'
  default:
    anchor: '100%'
  #contentEl : 'maininput'
  bodyPadding: 5
  url: '/message'
  items: [
    { fieldLabel: 'Message', name: 'content', allowBlank: false }
  ]
  buttons: [
    { text: 'Submit', formBind: true, handler: Ext.emptyFn }
  ]
