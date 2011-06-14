roomButton =
  text    : 'Rooms'
  icon    : '/assets/16x16/window_add.png'
  disabled: true
  handler : -> Ext.Msg.alert 'Status', 'In progress'

historyButton =
  text    : 'History'
  icon    : '/assets/16x16/clock.png'
  handler : -> Ext.Msg.alert 'Status', 'Not ready yet.'
  disabled: true
  
search = 
  xtype   : 'searchfield'
  id      : 'primarysearch'
  disabled: true
  
profileButton =
  text    : 'Your Profile'
  icon    : '/assets/16x16/user.png'
  handler : -> window.location = link.editReg

logoutButton = 
  text    : 'Logoff'
  icon    : '/assets/16x16/process.png'
  handler : -> window.location = link.logout

# Will use Ext.ComponentQuery.query('panel[room=0]') to retrieve.
genChat = 
  title  : 'General Chat'
  layout : 'border'
  room   : 0 
  items  : [ 
    { xtype  : 'chat.panel', region: 'center', id: 'messagePanel' }, 
    {
      region : 'south'
      xtype  : 'chat.inputpanel'
      items  : [ { xtype: 'msgfield' }, { xtype: 'msgroomfield', value: '0' } ]
    }
  ]

Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'fit'
    tbar: [ roomButton, historyButton, search, '->', profileButton, logoutButton ]
    #bbar: ['Status: ']
    items  : 
      xtype       : 'tabpanel'
      tabPosition : 'bottom'
      layout      : 'fit'
      id          : 'chatpad'
      items       : genChat