
Ext.define "ignis.view.GroupComboBox",
  extend         : "Ext.form.ComboBox"
  alias          : "widget.groupcombobox"
  queryMode      : 'local'
  displayField   : 'name'
  valueField     : 'id'
  forceSelection : true
  autoSelect     : true
  store          : Ext.data.StoreManager.lookup('groups')
  listeners      :
    focus          : (field, options) -> Ext.data.StoreManager.lookup('groups').load()
  listConfig     :
    loadingText    : 'Finding groups...'
    # getInnerTpl    : ->
    #   '<span style="font-weight: bold;">{name}</span><br /><span style="font-size: xx-small;">{description}</span>'
    
