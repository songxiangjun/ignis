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

Ext.define 'ignis.view.HistoryDateField'
  extend         : 'Ext.form.field.Date'
  alias          : 'widget.historydatefield'
  width          : 115
  msgTarget      : 'qtip'
  name           : 'enddt'
  vtype          : 'histdaterange'
  format         : 'Y/m/d'
  