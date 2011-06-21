roomBox =
  xtype     : 'roomcombobox'
  id        : 'pickroom'
  width     : 250
  emptyText : 'Select a room to join'
  listeners :
    focus     : (field, options) -> Ext.data.StoreManager.lookup('rooms').load()
    select    : (field, value, options) ->
      room = Ext.data.StoreManager.lookup('rooms').getById(field.getValue()).data
      if window.rc.roomExist room.id
        window.rc.setActiveRoom room.id
      else
        window.rc.joinRoom room.id, room.name, true

setupButton = 
  text     : 'Setup'
  disabled : true
  icon     : '/assets/16x16/database.png'
  menu     :
    items    : [
      { text: 'Add User to Group',  icon: '/assets/16x16/user_add.png' }
      '-'
      { text: 'Group Setup',           icon: '/assets/16x16/process.png'  } # Will have create, update and delete functionality
      { text: 'Room Setup',            icon: '/assets/16x16/process.png'  } # Will have create, update and delete functionality, restricted by group
    ]
  
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
    tbar   : [ roomBox, '-', historyButton, '-', setupButton, '->', profileButton, logoutButton ]
    bbar   : [ 'Users recently active: ', { xtype: 'tbtext', text: '', id: 'activeusers' } ]
    items  :
      xtype       : 'tabpanel'
      tabPosition : 'bottom'
      layout      : 'fit'
      id          : 'chatpad'
      items       : [ ]
      listeners   :
        tabchange    : changeTabFn
        beforeremove : tabRemoveFn
      
      