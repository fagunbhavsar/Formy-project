class CompleteForm < Page
  page_url         base_url

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
    p = @browser.button(:text => "Submit").click
    p.wait_until_present
  end

  def view_confirmation
    @browser.div(:text => "The form was successfully submitted!").exist?
  end
end
