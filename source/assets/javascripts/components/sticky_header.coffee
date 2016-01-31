class StickyHeader
  constructor: (options) ->
    @el            = options.el
    @content       = options.content
    @triggerHeight = options.triggerHeight

    $(document).on 'scroll', @_transformNav

  _scrollPosition: ->
    $(document).scrollTop()

  _transform: ->
    @el.addClass "transform"
    @content.addClass "transform"

  _revert: ->
    @el.removeClass "transform"
    @content.removeClass "transform"

  _transformNav: (e) =>
    e.preventDefault()
    if @_scrollPosition() > @triggerHeight
      @_transform()
    else
      @_revert()

$ ->
  new StickyHeader(el: $('#sticky-header'), content: $('main'), triggerHeight: 34)
