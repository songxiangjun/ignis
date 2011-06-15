Ext.define 'ignis.model.Rooms'
  extend : 'Ext.data.Model'
  fields : [ 'name', 'description', 'id' ]

Ext.define 'ignis.store.Rooms',
  extend   : 'Ext.data.Store'
  model    : 'ignis.model.Rooms'
  storeId  : 'rooms'
  autoLoad : true
  proxy    :
    type     : 'ajax'
    url      : '/rooms'
    reader   :
      type            : 'json'
      root            : 'rooms'
      successProperty : 'success'

Ext.create 'ignis.store.Rooms'