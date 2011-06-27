submitAdd = (b) ->
  values = b.up('form').getValues()
  Ext.Ajax.request 
    scope    : this
    url      : window.link.groups + '/' + values.group + '/associate'
    success  : (response) -> b.up('window').close()
    params   : values

loadSelectUsers = (field) ->
  selector = field.up('window').down('userselections')
  # Make a request to the server to get the associated peeps, and then set them on the selector
  selector.setRawValue myValues
  
Ext.define 'ignis.view.GroupUsersWindow',
  extend   : 'Ext.window.Window'
  alias    : 'widget.groupuserswindow'
  title    : 'Select Users for Group'
  layout   : 'fit'
  width    : 700
  modal    : true
  autoShow : true
  items    :
    xtype       : 'form'
    url         : window.link.groupadmin
    defaultType : 'textfield'
    frame       : true
    padding     : 5
    defaults    :
      anchor      : '100%'
      allowBlank  : false
    items       : [
      { fieldLabel : 'Group', name: 'group', xtype: 'groupcombobox'  }
      { fieldLabel : 'Users', name: 'users', xtype: 'userselections' }
    ]
    buttons     : [ 
      { text: 'Add User to Group', handler: submitAdd } 
    ]