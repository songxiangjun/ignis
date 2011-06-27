submitAdd = (b) ->
  values = b.up('form').getValues()
  if values.group is undefined
    Ext.Msg.alert 'Submission Invalid', 'Please supply a group to update the memberhip of!'
  else
    Ext.Ajax.request 
      scope    : this
      url      : window.link.groups + '/' + values.group + '/associate'
      success  : (response) -> Ext.Msg.alert('Status', 'Success!')
      params   : values

loadSelectedUsers = (field) ->
  field.up('form').down('userselections').setRawValue []
  formValues = field.up('form').getValues()
  Ext.Ajax.request 
    scope    : this
    method   : 'get'
    url      : window.link.groups + '/' + formValues.group + '/associate'
    success  : (response) -> 
      json = Ext.JSON.decode(response.responseText)
      field.up('form').down('userselections').setRawValue json.users
  
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
      { fieldLabel : 'Group', name: 'group', xtype: 'groupcombobox', listeners: { select: loadSelectedUsers }  }
      { fieldLabel : 'Users', name: 'users', xtype: 'userselections' }
    ]
    buttons     : [ 
      { text: 'Save Group Membership', handler: submitAdd } 
    ]