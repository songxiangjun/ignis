center =
  xtype: 'chat.panel'
  region: 'center'

south =
  xtype: 'chat.inputpanel'
  region: 'south'
  height: 100


Ext.define 'ignis.view.Viewport'
  extend : 'Ext.container.Viewport'
  alias  : 'widget.ignis'
  layout : 'fit'
  items  :
    xtype  : 'panel'
    layout : 'border'
    items  : [ center, south]
