class CompleteForm < Page
  page_url         base_url

  def enter_first_name(fname)
    @browser.text_field(:id => "first-name").set(fname)
  end

  def enter_last_name(lname)
    @browser.text_field(:id => "last-name").set(lname)
  end

  def enter_job_title(title)
    @browser.text_field(:id => "job-title").set(title)
  end

  def select_college
    @browser.radio(:id => "radio-button-2" ).set
  end

  def check_gender
    @browser.checkbox(:id => "checkbox-1").click
  end

  def select_exp
    @browser.select_list(:id => "select-menu", :value => "10+").select
  end

  def select_date
    @browser.element(:id => "datepicker").select(:class => "today day")
  end

  def click_submit
    #require "pry"; binding.pry
    @browser.element(:class => "btn", :text => "Submit").click
  end

  def view_confirmation
    @browser.div(:text => "The form was successfully submitted!").exist?
  end
end
