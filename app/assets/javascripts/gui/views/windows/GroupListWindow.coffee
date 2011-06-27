refreshButton = 
  text    : 'Refresh'
  icon    : '/assets/16x16/process.png'
  handler : (b) -> b.up('gridpanel').getStore().load()

Ext.define 'ignis.view.GroupListWindow'
  extend   : 'Ext.window.Window'
  alias    : 'widget.grouplistwindow'
  title    : 'Chat Groups'
  layout   : 'fit'
  width    : 400
  height   : 200
  autoShow : true
  bbar     : ['Note: You must have admin rights to a group to perform admin functions.']
  items    :
    xtype        : 'grid'
    border       : false
    singleSelect : true
    store        : Ext.data.StoreManager.lookup('groups')
    tbar         : [ refreshButton ]
    viewConfig   :
      emptyText      : 'No groups that you have access to were found.'
      deferEmptyText : false
    columns      : [
      { header: 'Group Name', dataIndex: 'name', flex: 1 }
    ]
    listeners    :
      add         : (that, opts) -> that.getStore().load()
