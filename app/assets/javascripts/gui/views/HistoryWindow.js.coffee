
Ext.apply Ext.form.field.VTypes, 
    histdaterange: (val, field) ->
      date = field.parseDate(val)

      if !date
        return false
      if field.startDateField and (!this.dateRangeMax or (date.getTime() isnt this.dateRangeMax.getTime()))
        start = field.up('window').down('#' + field.startDateField)
        start.setMaxValue date
        start.validate()
        this.dateRangeMax = date
      else if field.endDateField and (!this.dateRangeMin or (date.getTime() isnt this.dateRangeMin.getTime()))
        end = field.up('window').down('#' + field.endDateField)
        end.setMinValue date
        end.validate()
        this.dateRangeMin = date
      return true;

    histdaterangeText: 'Start date must be less than end date'


searchField = 
  xtype   : 'searchfield'
  width   : 200
  id      : 'primarysearch'

startDate =
  xtype        : 'datefield'
  width        : 115
  msgTarget    : 'qtip'
  name         : 'startdt'
  id           : 'startdt'
  vtype        : 'histdaterange'
  endDateField : 'enddt'
  format       : 'Y/m/d'
  emptyText    : 'Start date'
endDate =
  xtype          : 'datefield'
  width          : 115
  msgTarget      : 'qtip'
  name           : 'enddt'
  id             : 'enddt'
  vtype          : 'histdaterange'
  startDateField : 'startdt'
  format         : 'Y/m/d'
  emptyText      : 'End date'
getDates = ->
  { 
    start  : Ext.getCmp('startdt').getValue()
    end    : Ext.getCmp('enddt').getValue() 
    search : Ext.getCmp('primarysearch').getValue()
  }
submit =
  text     : 'Submit'
  icon     : '/assets/16x16/search.png'
  handler  : (button) -> 
    Ext.Ajax.request 
      scope    : this
      url      : '/plainhistory'
      success  : (response) -> button.up('window').down('panel').update(response.responseText)
      params   : getDates()

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
