class OpenFormPage < Page
  page_url      base_url

  def open_web_form
    #require 'pry'; binding.pry
    @browser.div(:class => "jumbotron-fluid").link(:text => "Complete Web Form").click
  end

end
