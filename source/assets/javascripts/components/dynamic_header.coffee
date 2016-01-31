class DynamicHeader
  constructor: (options) ->
    @$el = options.el

  listen: ->
    $(document).on('scroll', @_updateHeading)

  _updateHeading: (e) =>
    e.preventDefault()

    console.log @_scrollPosition()
    console.log "portfolio: #{$('#portfolio').offset().top}"
    if @_scrollPosition() >= 50 and @_scrollPosition() < 1000
      @$el.html('portfolio')
    else if @_scrollPosition() >= 1000 and @_scrollPosition() < 2000
      @$el.html('biography')
    else if @_scrollPosition() >= 2000
      @$el.html('contact')
    else
      @$el.html('architect' )

  _scrollPosition: ->
    $(document).scrollTop()

$ ->
  new DynamicHeader(el: $('.title-bar h1')).listen()
