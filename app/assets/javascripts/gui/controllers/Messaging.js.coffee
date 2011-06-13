Ext.define 'ignis.controller.Messaging',
  extend : 'Ext.app.Controller'
  init   : ->
    console.log 'Initializing messaging controller...'
    this.control
      '#msgfield':
        specialkey: this.onMessageKey
  onMessageKey: (f, e) ->
    if e.getKey() is e.ENTER
      Ext.Ajax.request
        url: link.sendMsg
        params:
          'message[content]': f.value
        success: ->
          window.pollFn()
        callback: ->
          f.reset()
    if e.getKey() is e.ESC
      f.reset()
