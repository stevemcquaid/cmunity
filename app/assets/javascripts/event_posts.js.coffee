 $ -> 
  $(window).resize(() ->
    $(".input-prepend, .input-append").each((index, element) ->
      input = $("input.append-resize", element).css('width', '')
      $(".add-on, .btn", element).each(() ->
        $addOn = $(this)
        $addOn.removeClass('hide')
        input.css('width', '-=' + $addOn.outerWidth())
      )
    )
  ).trigger('resize')