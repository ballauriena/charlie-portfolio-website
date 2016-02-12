class PhotoGallery
  constructor: (options) ->
    @$el        = options.el
    @thumbnails = options.thumbnails
    @project    = options.project

  setup: ->
    for thumbnail in @thumbnails
      new Thumbnail({ el: @$el, thumbnail: thumbnail, project: @project }).listen()

  class Thumbnail
    constructor: (options) ->
      @$el       = options.el
      @thumbnail = $(options.thumbnail)
      @project   = options.project

    listen: ->
      @thumbnail.on('click', @_changeImage)

    _changeImage: =>
      extension = @thumbnail.css('background-image').split(".").pop().replace('")', "")
      thing = @thumbnail.attr('id')
      @$el.attr('src', "/assets/images/#{@project}/#{thing}.#{extension}")

window.activateGallery = (project) ->
  new PhotoGallery({ el: $('.photo-display'), thumbnails: $('.thumbnails li'), project: project }).setup()
