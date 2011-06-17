
historyButton =
  text    : 'History'
  icon    : '/assets/16x16/clock.png'
  handler : -> Ext.widget 'historywindow'
  
profileButton =
  text    : 'Your Profile'
  icon    : '/assets/16x16/user.png'
  handler : -> window.location = link.editReg

logoutButton = 
  text    : 'Logoff'
  icon    : '/assets/16x16/process.png'
  handler : -> window.location = link.logout
  
changeTabFn = (tp, newpanel, oldpanel) -> 
  newpanel.setIconCls ''
  newpanel.setIconCls ''  # Yes, this needs to be here. For some reason Ext doesn't do it right without it.
tabRemoveFn = (tp, panel) ->
  window.rc.removeRoom panel.room

Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'fit'
    bbar   : [ 'Users recently active: ', { xtype: 'tbtext', text: '', id: 'activeusers' }, '->', historyButton, '-', profileButton, logoutButton ]
    items  :
      xtype       : 'tabpanel'
      tabPosition : 'top'
      layout      : 'fit'
      id          : 'chatpad'
      items       : [ { xtype: 'roompicker' } ]
      listeners   :
        tabchange    : changeTabFn
        beforeremove : tabRemoveFn
      
      