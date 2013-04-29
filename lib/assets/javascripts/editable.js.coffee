$ ->
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
  $(document).on "click", ".btnSave", ->
    newText = $(this).parent().children(".editBox").val().replace(/"/g, "&quot;")
    attribute = $(this).parent().attr('class').split(" ")[0]
    attribute = "#" + attribute
    if $(attribute).length != 0
      $(attribute).val(newText)
    $(this).parent().html(newText).removeClass("noPad").bind "click", replaceHTML
