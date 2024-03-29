roomBox =
  xtype     : 'roomcombobox'
  id        : 'pickroom'
  width     : 250
  emptyText : 'Jump to a room..'
  listeners :
    focus     : (field, options) -> Ext.data.StoreManager.lookup('rooms').load()
    blur      : (field) -> field.clearValue()
    select    : (field, value, options) ->
      room = Ext.data.StoreManager.lookup('rooms').getById(field.getValue()).data
      window.rc.joinRoom room.id, room.name

addUserToGroup = -> Ext.widget 'groupuserswindow'
listGroups = -> Ext.widget 'grouplistwindow'
addGroup = -> Ext.widget 'groupaddwindow'
groupMenu =
  text : 'Groups...'
  icon : '/assets/16x16/database.png'
  menu :
  	items: [
      { text: 'Select User for Group',  icon: '/assets/16x16/user_add.png', handler: addUserToGroup }
      '-'
  		{ text: 'List Groups',    icon: '/assets/16x16/process.png', handler: listGroups }
  		{ text: 'Create Group',   icon: '/assets/16x16/process.png', handler: addGroup } 
  	]
listRooms = -> Ext.widget 'roomlistwindow'
addRoom = -> Ext.widget 'roomaddwindow'
roomMenu =
  text : 'Rooms...'
  icon : '/assets/16x16/database.png'
  menu : 
  	items: [
  	  { text: 'List Rooms',       icon: '/assets/16x16/process.png', handler: listRooms}
  		{ text: 'Create new Room',  icon: '/assets/16x16/process.png', handler: addRoom } 
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
  newpanel.tab.setIcon ''
  newpanel.tab.ownerCt.doLayout()
tabRemoveFn = (tp, panel) ->
  window.rc.removeRoom panel.room

Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'fit'
    tbar   : [ roomBox, '-', historyButton, '-', roomMenu, groupMenu, '->', profileButton, logoutButton ]
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
      
      