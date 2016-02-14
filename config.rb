set :url_root, 'http://www.charliecrowe.co'


activate :imageoptim

# Configure assets directories
# ----------------------------------------------
config[:css_dir]    = 'assets/stylesheets'
config[:js_dir]     = 'assets/javascripts'
config[:images_dir] = 'assets/images'
config[:fonts_dir]  = 'assets/fonts'

configure :development do
  activate :directory_indexes
  set :debug_assets, true
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

activate :bitballoon do |bitballoon|
  bitballoon.token = ENV["BB_TOKEN"]
  bitballoon.site  = 'charliecrowe.bitballoon.com'
  bitballoon.build_before = true
end
