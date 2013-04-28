$ ->
  # variable nav buttons - evenly spaced
  formatNav = (el) ->
    nav = $(el)
    menuItemCount = nav.children().length
    menuItemOuterWidth = nav.children().outerWidth(true) # border + padding + margin + base width of the menu item
    menuItemWidth = nav.children().width() # base width
    menuItemDiff = menuItemOuterWidth - menuItemWidth # border + padding + margin only for the menuItem
    navWidth = nav.width()
    nav.children().width Math.round(navWidth / menuItemCount) - menuItemDiff
  formatNav('.auto-nav1')
  formatNav('.auto-nav2')
  formatNav('.auto-nav3')

  # Handle window resizing
  $(window).resize ->
    formatNav('.auto-nav1')
    formatNav('.auto-nav2')
    formatNav('.auto-nav3')