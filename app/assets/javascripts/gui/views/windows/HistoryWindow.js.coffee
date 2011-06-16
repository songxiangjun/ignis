
startDate =
  xtype        : 'historydatefield'
  id           : 'startdt'
  endDateField : 'enddt'
  emptyText    : 'Start date'
endDate =
  xtype          : 'historydatefield'
  id             : 'enddt'
  startDateField : 'startdt'
  emptyText      : 'End date'
searchField = 
  xtype   : 'searchfield'
  width   : 200
  id      : 'primarysearch'
submit =
  text     : 'Submit'
  icon     : '/assets/16x16/search.png'
  handler  : (button) -> 
    Ext.Ajax.request 
      scope    : this
      url      : '/plainhistory'
      success  : (response) -> button.up('window').down('panel').update(response.responseText)
      params   : ->
        { 
          start  : Ext.getCmp('startdt').getValue()
          end    : Ext.getCmp('enddt').getValue() 
          search : Ext.getCmp('primarysearch').getValue()
        }

Ext.define 'ignis.view.HistoryWindow'
  extend   : 'Ext.window.Window'
  alias    : 'widget.historywindow'
  layout   : 'fit'
  title    : 'Chat History'
  height   : 400
  width    : 700
  autoShow : true
  autoRender: true
  modal    : true
  tbar     : [ startDate, 'to', endDate, '-', searchField, '->', submit ]
  items    : 
    autoScroll  : true
    layout      : 'fit'
    bodyPadding : 5
    html        : 'Pick a date range or submit a search.'
