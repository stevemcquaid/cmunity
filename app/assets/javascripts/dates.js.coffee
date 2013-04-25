$ ->
  $("#start-date").datepicker(
    startView: 1
    autoclose: true
  ).on "changeDate", (ev) ->
    startDate = new Date(ev.date)
    $("#end-date").datepicker "setStartDate", startDate
    $("#end-date").focus()

  $("#end-date").datepicker(
    startView: 1
    autoclose: true
  ).on "changeDate", (ev) ->
    endDate = new Date(ev.date)
    $("#start-date").datepicker "setEndDate", endDate
    $("#end-date").focus()
