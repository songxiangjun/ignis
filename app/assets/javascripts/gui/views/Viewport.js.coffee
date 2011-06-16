
roomButton =
  text    : 'Rooms'
  icon    : '/assets/16x16/comments.png'
  handler : ->
    Ext.data.StoreManager.lookup('rooms').load()
    Ext.widget 'roompicker'

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
    tbar: [ roomButton, historyButton, '->', profileButton, logoutButton ]
    bbar: [ 'Users recently active: ', { xtype: 'tbtext', text: '', id: 'activeusers' } ]
    #bbar: ['Status: ']
    items  : 
      xtype       : 'tabpanel'
      tabPosition : 'bottom'
      layout      : 'fit'
      id          : 'chatpad'
      items       : []
      listeners   :
        tabchange    : changeTabFn
        beforeremove : tabRemoveFn
      
      