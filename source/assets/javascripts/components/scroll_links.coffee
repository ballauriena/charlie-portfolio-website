class ScrollLinks
  constructor: (options) ->
    @links = options.links

  setup: ->
    for link in @links
      new ScrollLink({ el: link }).activateScroll()

  class ScrollLink
    constructor: (options) ->
      @$el = options.el

    activateScroll: ->
      @_listen()

    _listen: ->
      @$el.on('click', @_handleScroll)

    _handleScroll: (e) =>
      e.preventDefault()
      console.log @_element()
      $('html, body').animate({
        scrollTop: @_element().offset().top - 250
      }, 1000);

    _element: ->
      $("#{@$el.attr('href')}")


$ ->
  new ScrollLinks({ links: [$('a[href=#portfolio]'), $('a[href=#biography]'), $('a[href=#contact]')] }).setup()
