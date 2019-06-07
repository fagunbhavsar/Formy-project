class FuseappPage < Page
  page_url  base_url

  def open_app_page
    @browser.element(:id => 'link-create').click
  end

end