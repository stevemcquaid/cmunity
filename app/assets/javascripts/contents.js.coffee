$ ->
	$(".private").on "change", ->
    if $(".private").is(":checked")
    	$("#group_section").show()
    else
      $("#group_input").val ""
     	$("#group_section").hide() 	
  $('.selectpicker').selectpicker()