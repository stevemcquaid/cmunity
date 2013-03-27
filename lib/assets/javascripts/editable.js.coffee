$(document).ready ->
  replaceHTML = ->
    oldText = $(this).html().replace(/"/g, "&quot;")
    $(this).addClass("noPad").html("").html("<form class=\"form-inline editable-form\"><input type=\"text\" class=\"editBox\" value=\"" + oldText + "\" /> </form><a href=\"#\" class=\"btnSave\">Save changes</a> <a href=\"#\" class=\"btnDiscard\">Discard changes</a>").unbind "click", replaceHTML
  oldText = undefined
  newText = undefined
  $(".editable").hover (->
    $(this).addClass "editHover"
  ), ->
    $(this).removeClass "editHover"

  $(".editable").bind "click", replaceHTML
  $("form.editable-form").submit ->
    false
  $(".editBox").keypress (e) ->
    code = ((if e.keyCode then e.keyCode else e.which))
    if code is 13
       newText = $(this).val().replace(/"/g, "&quot;")
      $(this).parents(".editable").html(newText).removeClass("noPad").bind "click", replaceHTML 


  $(".btnSave").on "click", ->
    newText = $(this).siblings("form").children(".editBox").val().replace(/"/g, "&quot;")
    $(this).parent().html(newText).removeClass("noPad").bind "click", replaceHTML