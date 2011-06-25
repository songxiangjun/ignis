Ext.define 'ignis.model.Groups', 
  extend : 'Ext.data.Model'
  fields : [
    { name: 'name', type: 'string' }
    { name: 'id',   type: 'int' } 
  ]

Ext.define 'ignis.store.Groups',
  extend   : 'Ext.data.Store'
  model    : 'ignis.model.Groups'
  proxy    :
    type     : 'ajax'
    url      : window.link.groups
    reader   :
      type            : 'json'
      root            : 'groups'
      successProperty : 'success'

Ext.create 'ignis.store.Groups', { storeId  : 'groups' }
