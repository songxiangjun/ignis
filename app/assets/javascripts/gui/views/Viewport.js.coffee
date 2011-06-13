editRegistration = -> window.location = link.editReg
profileButton =
  text    : 'Your Profile'
  icon    : '/assets/16x16/user.png'
  handler : editRegistration
  
logout = -> window.location = link.logout
logoutButton = 
  text    : 'Logoff'
  icon    : '/assets/16x16/process.png'
  handler : logout

center =
  xtype  : 'chat.panel'
  region : 'center'
  id     : 'messages'

south =
  xtype  : 'chat.inputpanel'
  region : 'south'

Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'border'
    tbar: [ profileButton, '->', logoutButton ]
    #bbar: ['Status: ']
    items  : [ center, south ]