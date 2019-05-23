require 'rspec'
require 'watir'
require 'fig_newton'
require 'look_like'

def load_pages
  ENV["url"] = FigNewton.urls.send("default")
  require_relative "../../lib/pages/base_page"

  Dir["./lib/pages/*.rb"].each do |file|
    require file
  end

  Dir["#{FigNewton.page_dir.send(ENV["page_dir"])}/**/*.rb"].each do |file|
    require file
  end unless ENV["page_dir"].nil?
end

at_exit do
  puts "done"
end

load_pages
World(PageObject::PageFactory)