logout = -> window.location = link.logout
editRegistration = -> window.location = link.editReg


center =
  xtype: 'chat.panel'
  region: 'center'
  tbar: [
    {
      text: 'Your Profile'
      handler: editRegistration
    }
    '->'
    {
      text: 'Logoff'
      handler: logout
    }
  ]

south =
  xtype: 'chat.inputpanel'
  region: 'south'



Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'border'
    items  : [ center, south]
