$ ->
  delay = (->
    timer = 0
    (callback, ms) ->
      clearTimeout timer
      timer = setTimeout(callback, ms)
  )()
  ValidURL = (str) ->
    pattern = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi
    unless pattern.test(str)
      false
    else
      true
  $("#url-input").bind "input keyup", ->
    $this = $(this);
    $('#fetch-data-url').show() 
    $('#fetch-data-url .row-fluid').hide()    
    $('.loading').html('<img src="/assets/preloader.gif" />')
    $('#fetch-data-url p.description').html('Loading....')
    $('#fetch-data-url .title').html('')
    $('#fetch-data-url p.description').html('')
    $('#fetch-data-url img.preview_img').hide()
    $('#fetch-data-url small.site_url').html('')
    input_url = $this.val()
    if ValidURL(input_url)
      delay (->
        $.ajax(
          type: "GET"
          url: "/fetch"
          data:
            url: input_url
        ).done (obj) ->
          console.log obj
          $('.loading').html('')
          if obj == false
            $('#fetch-data-url p.description').html('Returned False')
          $('#fetch-data-url').show()
          $('#fetch-data-url .row-fluid').show()      
          $('#fetch-data-url h4.title').html(obj.title)
          $('#title').val(obj.title)
          $('#description').val(obj.description)
          $('#image_url').val(obj.image)
          $('#fetch-data-url p.description').html(obj.description)
          $('#fetch-data-url img.preview_img').attr('src', obj.image).show()
          $('#fetch-data-url small.site_url').html(obj.url)
      ), 2000