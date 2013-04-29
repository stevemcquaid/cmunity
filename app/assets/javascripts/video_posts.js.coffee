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
  $("#video-url-input").bind "input keyup", ->
      $this = $(this);
      $('#fetch-data-video').show() 
      $('#fetch-data-video .row-fluid').hide()    
      $('.loading').html('<img src="/assets/preloader.gif" />')
      $('#fetch-data-video p.description').html('Loading....')
      $('#fetch-data-video .title').html('')
      $('#fetch-data-video p.description').html('')
      $('#fetch-data-video .embed').html('')
      $('#fetch-data-video small.site_url').html('')
      input_url = $this.val()
      if ValidURL(input_url)
        delay (->
          $.ajax(
            type: "GET"
            url: "/fetchvid"
            data:
              url: input_url
          ).done (obj) ->
            console.log obj
            $('.loading').html('')
            if obj == false
              $('#fetch-data-video p.description').html('Returned False')
            $('#fetch-data-video').show()
            $('#fetch-data-video .row-fluid').show()      
            $('#fetch-data-video h4.title').html(obj.title)
            $('#title').val(obj.title)
            $('#description').val(obj.description)
            $('#embed_code').val(obj.embed)
            $('#fetch-data-video p.description').html(obj.description)
            $('#fetch-data-video .embed').html(obj.embed)
            $('#fetch-data-video small.site_url').html(obj.url)
        ), 2000