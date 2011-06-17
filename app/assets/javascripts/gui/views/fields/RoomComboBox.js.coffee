
Ext.define "ignis.view.RoomComboBox",
  extend         : "Ext.form.ComboBox"
  alias          : "widget.roomcombobox"
  queryMode      : 'local'
  displayField   : 'name'
  valueField     : 'id'
  forceSelection : true
  autoSelect     : true
  store          : Ext.data.StoreManager.lookup('rooms')
  listConfig     :
    loadingText    : 'Finding rooms...'
    emptyText      : 'Pick a room'
    getInnerTpl    : ->
      '<span style="font-weight: bold;">{name}</span><br /><span style="font-size: xx-small;">{description}</span>'
    
