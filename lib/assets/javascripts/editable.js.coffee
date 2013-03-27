$(document).ready ->
  replaceHTML = ->
    oldText = $(this).html().replace(/"/g, "&quot;")
    $(this).addClass("noPad").html("").html("<form class=\"edit-form\"><input type=\"text\" class=\"editBox\" value=\"" + oldText + "\" /> </form><a href=\"#\" class=\"btn btnSave\">&#10004;</a>").unbind "click", replaceHTML
  oldText = undefined
  newText = undefined
  $(".editable").hover (->
    $(this).addClass "editHover"
  ), ->
    $(this).removeClass "editHover"

  $(".editable").bind "click", replaceHTML
  $("body").on "click", ".btnSave", ->
    newText = $(this).siblings("form.edit-form").children(".editBox").val().replace(/"/g, "&quot;")
    $(this).parent().html(newText).removeClass("noPad").bind "click", replaceHTML
