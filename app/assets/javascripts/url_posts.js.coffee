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
    $('p.desc').html('Loading....')
    $('h3.title').html('')
    $('p.desc').html('')
    $('img.preview_img').attr('src', '')
    $('small.site_url').html('')
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
          if obj == false
            $('p.desc').html('Returned False')
          $('h3.title').html(obj.title)
          $('p.desc').html(obj.description)
          $('img.preview_img').attr('src', obj.image)
          $('small.site_url').html(obj.url)
      ), 2000