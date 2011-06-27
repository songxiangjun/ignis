
Ext.define "ignis.view.UserComboBox",
  extend         : "Ext.form.ComboBox"
  alias          : "widget.usercombobox"
  queryMode      : 'local'
  displayField   : 'username'
  valueField     : 'id'
  forceSelection : true
  autoSelect     : true
  store          : Ext.data.StoreManager.lookup('users')
  listeners      :
    focus          : (field, options) -> Ext.data.StoreManager.lookup('users').load()
  listConfig     :
    loadingText    : 'Finding users...'
    
