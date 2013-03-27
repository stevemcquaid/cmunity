# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
curImages = new Array()
$("#urlfield").liveUrl
  loadStart: ->
    $(".liveurl-loader").show()

  loadEnd: ->
    $(".liveurl-loader").hide()

  success: (data) ->
    curImages = new Array()
    output = $(".liveurl")
    output.find(".title").text data.title
    output.find(".description").text data.description
    output.find(".url").text data.url
    output.find(".image").empty()
    output.find(".close").one "click", ->
      liveUrl = $(this).parent()
      liveUrl.hide "fast"
      liveUrl.find(".video").html("").hide()
      liveUrl.find(".image").html ""
      liveUrl.find(".controls .prev").addClass "inactive"
      liveUrl.find(".controls .next").addClass "inactive"
      liveUrl.find(".thumbnail").hide()
      liveUrl.find(".image").hide()
      $("#urlfield").trigger "clear"
      curImages = new Array()

    output.show "fast"
    if data.video?
      ratioW = data.video.width / 350
      data.video.width = 350
      data.video.height = data.video.height / ratioW
      video = "<object width=\"" + data.video.width + "\" height=\"" + data.video.height + "\">" + "<param name=\"movie\"" + "value=\"" + data.video.file + "\"></param>" + "<param name=\"allowScriptAccess\" value=\"always\"></param>" + "<embed src=\"" + data.video.file + "\"" + "type=\"application/x-shockwave-flash\"" + "allowscriptaccess=\"always\"" + "width=\"" + data.video.width + "\" height=\"" + data.video.height + "\"></embed>" + "</object>"
      output.find(".video").html(video).show()

  addImage: (image) ->
    output = $(".liveurl")
    jqImage = $(image)
    jqImage.attr "alt", "Preview"
    
    # we dont want extra large images...
    return false  if (image.width / image.height) > 7 or (image.height / image.width) > 4
    curImages.push jqImage.attr("src")
    output.find(".image").append jqImage
    if curImages.length is 1
      
      # first image...
      output.find(".thumbnail .current").text "1"
      output.find(".thumbnail").show()
      output.find(".image").show()
      jqImage.addClass "active"
    output.find(".controls .next").removeClass "inactive"  if curImages.length is 2
    output.find(".thumbnail .max").text curImages.length

$(".liveurl ").on "click", ".controls .button", ->
  self = $(this)
  liveUrl = $(this).parents(".liveurl")
  content = liveUrl.find(".image")
  images = $("img", content)
  activeImage = $("img.active", content)
  if self.hasClass("next")
    elem = activeImage.next("img")
  else
    elem = activeImage.prev("img")
  if elem.length > 0
    activeImage.removeClass "active"
    elem.addClass "active"
    liveUrl.find(".thumbnail .current").text elem.index() + 1
    self.addClass "inactive"  if elem.index() + 1 is images.length or elem.index() + 1 is 1
  if self.hasClass("next")
    other = elem.prev("img")
  else
    other = elem.next("img")
  if other.length > 0
    if self.hasClass("next")
      self.prev().removeClass "inactive"
    else
      self.next().removeClass "inactive"
  else
    if self.hasClass("next")
      self.prev().addClass "inactive"
    else
      self.next().addClass "inactive"
jQuery ->
  $(".url-submit[type='submit']").click ->
    description = undefined
    domain = undefined
    image = undefined
    title = undefined
    title = $(".title").html()
    description = $(".description").html()
    domain = $(".url").html()
    image = $(".image").children(".active").attr("src")
    $(".title_field").val title
    $(".desc_field").val description
    $(".domain_field").val domain
    $(".image_field").val image