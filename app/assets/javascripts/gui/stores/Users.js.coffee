Ext.define 'ignis.model.Users',
  extend : 'Ext.data.Model'
  fields : [ 'username', 'id' ]

Ext.define 'ignis.store.Users',
  extend   : 'Ext.data.Store'
  model    : 'ignis.model.Users'
  storeId  : 'users'
  autoLoad : true
  proxy    :
    type     : 'ajax'
    url      : window.link.users
    reader   :
      type            : 'json'
      root            : 'users'
      successProperty : 'success'

Ext.create 'ignis.store.Users'