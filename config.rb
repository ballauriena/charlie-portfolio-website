set :url_root, 'http://charliecrowe.bitballoon.com'

# Configure assets directories
# ----------------------------------------------
config[:css_dir]    = 'assets/stylesheets'
config[:js_dir]     = 'assets/javascripts'
config[:images_dir] = 'assets/images'
config[:fonts_dir]  = 'assets/fonts'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end


# Build-specific configuration
# ----------------------------------------------
configure :build do
  # Use relative URLs
  activate :directory_indexes

  # Activate gzip
  activate :gzip

  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Add asset fingerprinting to avoid cache issues
  activate :asset_hash, exts: %w(js css)

  # Enable cache buster
  activate :cache_buster

  # Compress PNGs after build (First: gem install middleman-smusher)
  # require "middleman-smusher"
  # activate :smusher

  # create sitemap.xml
  activate :search_engine_sitemap
end

helpers do
  def body_class
    [current_page.data.body_class, title.gsub(/[\s_]/, "-")].compact.join(" ")
  end

  def title
    current_page.data.title.presence ||
    current_article.try(:title) ||
    yield_content(:title).to_s
  end
end
