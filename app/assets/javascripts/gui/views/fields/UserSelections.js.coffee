
Ext.define "ignis.view.UserSelections",
  extend         : "Ext.ux.form.ItemSelector"
  alias          : "widget.userselections"
  queryMode      : 'local'
  imagePath      : '/assets/extux'
  store          : Ext.data.StoreManager.lookup('users')
  displayField   : 'username'
  valueField     : 'id'
  allowBlank     : false
  msgTarget      : 'side'
  buttons        : ['add', 'remove']
  listeners      :
    add            : (field, options) -> Ext.data.StoreManager.lookup('users').load()
