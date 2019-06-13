class CompleteForm < Page
  page_url         base_url

  def enter_first_name(fname)
    @browser.element(:id => "first-name").set(fname)
  end

  def enter_last_name(lname)
    @browser.element(:id => "last-name").set(lname)
  end

  def enter_job_title(title)
    @browser.element(:id => "job-title").set(title)
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
