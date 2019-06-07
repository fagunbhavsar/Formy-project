class FormPage < Page
  page_url      base_url

  def open_web_form
    @browser.element(:text => "Complete Web Form").click
  end

  def enter_first_name
    @browser.element(:id => "first-name").set(fisrtname)
  end

  def enter_last_name
    @browser.element(:id => "last-name").set(lastname)
  end

  def enter_job_title
    @browser.element(:id => "job-title").set(jobtitle)
  end

  def select_college
    @browser.radio(:text => "
        College
      ").set
  end

  def check_gender
    @browser.checkbox(:text => "        Male
").click
  end

  def select_exp
    @browser.select_list(:id => "select-menu").select("10+")
  end

  def select_date
    @browser.element(:id => "datepicker").select(:class => "today day")
  end

  def click_submit
    @browser.button(:text => "Submit").click
  end

end
