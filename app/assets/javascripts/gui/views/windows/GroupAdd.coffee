submitGroup = (b) ->
  values = b.up('form').getValues()
  Ext.Ajax.request 
    scope    : this
    url      : window.link.groups
    success  : (response) -> b.up('window').close()
    params   : values

Ext.define 'ignis.view.GroupAddWindow',
  extend   : 'Ext.window.Window'
  alias    : 'widget.groupaddwindow'
  title    : 'Create Group'
  layout   : 'fit'
  width    : 400
  modal    : true
  autoShow : true
  items    :
    xtype       : 'form'
    url         : window.link.groups
    defaultType : 'textfield'
    frame       : true
    padding     : 5
    defaults    :
      anchor      : '100%'
    items       :
      fieldLabel  : 'Name'
      name        : 'group[name]'
      allowBlank  : false
    buttons     : [ 
      { text: 'Submit Group', handler: submitGroup } 
    ]