Ext.define 'ignis.model.Groups'
  extend : 'Ext.data.Model'
  fields : [ 'name', 'id' ]

Ext.define 'ignis.store.Groups',
  extend   : 'Ext.data.Store'
  model    : 'ignis.model.Groups'
  storeId  : 'groups'
  autoLoad : true
  proxy    :
    type     : 'ajax'
    url      : window.link.groups
    reader   :
      type            : 'json'
      root            : 'groups'
      successProperty : 'success'

Ext.create 'ignis.store.Groups'