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

listGroups = -> Ext.widget 'grouplistwindow'
addGroup = -> Ext.widget 'groupaddwindow'
groupMenu =
	items: [
    { text: 'Add User to Group',  icon: '/assets/16x16/user_add.png', disabled: true }
    '-'
		{ text: 'List Groups',    icon: '/assets/16x16/process.png', handler: listGroups }
		{ text: 'Create Group',   icon: '/assets/16x16/process.png', handler: addGroup } 
	]
listRooms = -> Ext.widget 'roomlistwindow'
roomMenu =
	items: [
	  { text: 'List Rooms',       icon: '/assets/16x16/process.png', handler: listRooms}
		{ text: 'Create new Room',  icon: '/assets/16x16/process.png', disabled: true } 
	]
setupButton = 
  text     : 'System'
  icon     : '/assets/16x16/database.png'
  menu     :
    items    : [
      { text: 'Groups', menu: groupMenu }
      { text: 'Rooms',  menu: roomMenu }
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
      
      