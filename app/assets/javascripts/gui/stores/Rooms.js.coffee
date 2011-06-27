Ext.define 'ignis.model.Rooms',
  extend : 'Ext.data.Model'
  fields : [ 'name', 'description', 'id', {name: 'group_name', mapping: 'group.name'} ]

Ext.define 'ignis.store.Rooms',
  extend   : 'Ext.data.Store'
  model    : 'ignis.model.Rooms'
  storeId  : 'rooms'
  autoLoad : true
  proxy    :
    type     : 'ajax'
    url      : window.link.rooms
    reader   :
      type            : 'json'
      root            : 'rooms'
      successProperty : 'success'

Ext.create 'ignis.store.Rooms'