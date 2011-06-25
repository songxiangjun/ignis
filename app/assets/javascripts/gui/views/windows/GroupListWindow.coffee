Ext.define 'ignis.view.GroupListWindow'
  extend   : 'Ext.window.Window'
  alias    : 'widget.grouplistwindow'
  title    : 'Administer Groups'
  layout   : 'fit'
  width    : 400
  height   : 200
  autoShow : true
  items    :
    xtype        : 'grid'
    border       : false
    singleSelect : true
    store        : Ext.data.StoreManager.lookup('groups')
    viewConfig   :
      emptyText      : 'No groups that you have access to were found.'
      deferEmptyText : false
    columns      : [
      { header: 'Group Name', dataIndex: 'name', flex: 1 }
    ]
    listeners    :
      add         : (that, opts) -> that.getStore().load()
