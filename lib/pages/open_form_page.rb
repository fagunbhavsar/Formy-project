class OpenFormPage < Page
  page_url      base_url

  def open_web_form
    @browser.element(:text => "Complete Web Form").click
  end

end
