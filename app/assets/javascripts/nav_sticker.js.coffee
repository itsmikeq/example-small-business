class NavSticker
  constructor: ()->

  @add_nav:(nav) ->
    # Stick the .call-box to the top of the window
    if nav.length < 1
      return false
    navHomeY = nav.offset().top
    isFixed = false
    $w = $(window)
    $w.scroll ->
      scrollTop = $w.scrollTop()
      shouldBeFixed = scrollTop > navHomeY
      if shouldBeFixed and not isFixed
        nav.css
          position: "fixed"
          top: 0
          left: nav.offset().left
          width: nav.width()

        isFixed = true
      else if not shouldBeFixed and isFixed
        nav.css position: "static"
        isFixed = false

    scrollTop = $w.scrollTop()
    shouldBeFixed = scrollTop > navHomeY
    if shouldBeFixed and not isFixed
      nav.css
        position: "fixed"
        top: 0
        left: nav.offset().left
        width: nav.width()

      isFixed = true
    else if not shouldBeFixed and isFixed
      nav.css position: "static"
      isFixed = false

@NavSticker = NavSticker
