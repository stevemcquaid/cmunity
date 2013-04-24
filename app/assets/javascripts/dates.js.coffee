$ ->
	sdate = $("#startdate").datepicker().on("changeDate", (ev) ->
	  if ev.date.valueOf() > checkout.date.valueOf()
	    newDate = new Date(ev.date)
	    # newDate.setDate(newDate.getDate());
	    edate.setValue newDate
	  sdate.hide()
	  $("#enddate")[0].focus()
	)
	edate = $("#enddate").datepicker(beforeShowDay: (date) ->
	  (if date.valueOf() <= sdate.date.valueOf() then true else false)
	).on("changeDate", (ev) ->
	  sdate.hide()
	)