$ ->
  $("#start-time").timepicker
    minuteStep: 15


  $("#end-time").timepicker
    minuteStep: 15

  $(".all_day").change ->
    if @checked
      oldStart = $("#start-time").val()
      oldEnd = $("#end-time").val()
      $("#start-time").after "<input type=\"hidden\" id=\"old-start\" value=\"" + oldStart + "\">"
      $("#end-time").after "<input type=\"hidden\" id=\"old-end\" value=\"" + oldEnd + "\">"
      $("#start-time").timepicker "setTime", "12:00 AM"
      $("#start-time").prop "disabled", true
      $("#end-time").timepicker "setTime", "11:59 PM"
      $("#end-time").prop "disabled", true
    else
      $("#start-time").val $("#old-start").val()
      $("#end-time").val $("#old-end").val()
      $("#start-time").prop "disabled", false
      $("#end-time").prop "disabled", false