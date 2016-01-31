class ScrollLinks
  constructor: (options) ->
    @links = options.links

  setup: ->
    for link in @links
      new ScrollLink({ el: link, links: @links }).activateScroll()

  class ScrollLink
    constructor: (options) ->
      @$el   = options.el
      @links = options.links

    activateScroll: ->
      @_listen()

    _listen: ->
      @$el.on('click', @_handleScroll)

    _handleScroll: (e) =>
      e.preventDefault()
      @_deactivateLinks()
      @_scrollToElement()
      @_activateLink()

    _scrollToElement: ->
      $('html, body').animate({
        scrollTop: @_element().offset().top - 250
      }, 1000)

    _element: ->
      $("#{@$el.attr('href')}")

    _deactivateLinks: ->
      for link in @links
        link.removeClass('active')

    _activateLink: ->
      @$el.addClass('active')


$ ->
  new ScrollLinks({ links: [$('a[href=#portfolio]'), $('a[href=#biography]'), $('a[href=#contact]')] }).setup()
