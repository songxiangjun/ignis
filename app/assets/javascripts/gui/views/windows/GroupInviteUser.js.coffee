submitAdd = (b) ->
  values = b.up('form').getValues()
  Ext.Ajax.request 
    scope    : this
    url      : window.link.groups + '/' + values.group + '/associate'
    success  : (response) -> b.up('window').close()
    params   : values

Ext.define 'ignis.view.GroupInviteUserWindow',
  extend   : 'Ext.window.Window'
  alias    : 'widget.groupinvitewindow'
  title    : 'Add User to Group'
  layout   : 'fit'
  width    : 400
  modal    : true
  autoShow : true
  items    :
    xtype       : 'form'
    url         : window.link.groupinvite
    defaultType : 'textfield'
    frame       : true
    padding     : 5
    defaults    :
      anchor      : '100%'
      allowBlank  : false
    items       : [
      { fieldLabel : 'Group', name: 'group', xtype: 'groupcombobox' }
      { fieldLabel : 'User',  name: 'user',  xtype: 'usercombobox'  }
    ]
    buttons     : [ 
      { text: 'Add User to Group', handler: submitAdd } 
    ]