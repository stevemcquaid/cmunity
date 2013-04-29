$ ->

  $("#image-url-input").bind "input keyup", ->
    $this = $(this);
    $('#fetch-data-image p.desc').html('Loading....')
    $('#fetch-data-image h3.title').html('')
    $('#fetch-data-image p.desc').html('')
    $('#fetch-data-image img.preview_img').attr('src', '')
    $('#fetch-data-image small.site_url').html('')
    input_url = $this.val()
    if ValidURL(input_url)
      delay (->
        $.ajax(
          type: "GET"
          url: "/fetchimg"
          data:
            url: input_url
        ).done (obj) ->
          console.log obj
          if obj == false
            $('#fetch-data-image p.desc').html('Returned False')
          $('#fetch-data-image h3.title').html(obj.title)
          $('#fetch-data-image p.desc').html(obj.description)
          $('#fetch-data-image img.preview_img').attr('src', obj.image)
          $('#fetch-data-image small.site_url').html(obj.url)
      ), 2000