class PhotoGallery
  constructor: (options) ->
    @$el        = options.el
    @thumbnails = options.thumbnails

  setup: ->
    for thumbnail in @thumbnails
      new Thumbnail({ el: @$el, thumbnail: thumbnail }).listen()

  class Thumbnail
    constructor: (options) ->
      @$el       = options.el
      @thumbnail = $(options.thumbnail)

    listen: ->
      @thumbnail.on('click', @_changeImage)

    _changeImage: =>
      extension = @thumbnail.css('background-image').split(".").pop().replace('")', "")
      thing = @thumbnail.attr('id')
      @$el.attr('src', "/assets/images/tanzania-hotel/#{thing}.#{extension}")

$ ->
  new PhotoGallery({ el: $('.photo-display'), thumbnails: $('.thumbnails li') }).setup()
