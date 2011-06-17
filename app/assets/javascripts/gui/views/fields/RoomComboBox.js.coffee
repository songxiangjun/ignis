
Ext.define "ignis.view.RoomComboBox",
  extend         : "Ext.form.ComboBox"
  alias          : "widget.roomcombobox"
  queryMode      : 'local'
  displayField   : 'name'
  valueField     : 'id'
  forceSelection : true
  autoSelect     : true
  store          : Ext.data.StoreManager.lookup('rooms')