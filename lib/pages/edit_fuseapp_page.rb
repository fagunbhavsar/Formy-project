class EditFuseappPage < Page
  page_url  base_url

  def view_pop_up
    @browser.element(:text => 'Let\'s get started!').wait_until_present
  end

  def get_started
    @browser.element(:text => 'Let\'s get started!').click
  end

  def see_app_panel
      @browser.element(:class => 'ui-page-panel').exist?
  end

  def view_basic_tab
      @browser.element(:text => '    Basic  ').exist?
  end

  #def view_basic_tab_details
      #@browser.element(:class => 'ui-accordion-content', :index => 0).exist?
      #@browser.element(:class => )
  #nd

  def view_messaging_tab
      @browser.element(:text => 'Messaging').exist?
  end

  #def view_messaging_tab_details

  #end

  def click_messaging_tab
    msg_tab = @browser.element(:text => 'Messaging')
    msg_tab.click
    msg_tab.wait_until_present
  end

  def view_start_module
    @browser.element(:class => 'module-title', :text => 'Start').exist?
  end

  def add_page
    new = @browser.element(:id => 'add-page')
    new.click
    new.wait_until_present
  end

  def see_newpage_popup
    @browser.element(:id => 'ui-dialog-title-create-dialog').exist?
  end

  def enter_new_name(title)
    @browser.text_field(:class => 'submitonenter').set(title)
    @browser.send_keys(:return)
  end

  def module_send_n_sms
    #require "pry"; binding.pry
    @browser.div(:class => 'ui-accordion-content', :index => 3).li(:class => 'ui-draggable', :index => 2).a(:class => 'module-add').click
  end

  def sms_module_ports
    #require "pry"; binding.pry
    @browser.div(:id => "tabs-2").div(:id => "module-1").div(:class => "mod-south").div(:class => "ui-draggable").exist?
    @browser.div(:class => "syn-module syn-module-green").div(:class => "mod-north").div(:class => "ui-droppable").exist?
  end

  def connect_sms_module
    start = @browser.div(:id => "tabs-2").div(:id => "module-1").div(:class => "mod-south").div(:class => "ui-draggable")
    dest = @browser.div(:class => "syn-module syn-module-green").div(:class => "mod-north").div(:class => "ui-droppable")
    start.drag_and_drop_on dest
  end

  def set_phone_number(number)
    #require "pr"; binding.pry
    @browser.textarea(:name => 'phone_constant').set(number)
  end

  def set_message_text(message)
    @browser.textarea(:name => 'message_phrase[]').set(message)
  end

  def module_send_an_email
    #require "pry"; binding.pry
    @browser.div(:class => 'ui-accordion-content', :index => 3).li(:class => 'ui-draggable', :index => 1).drag_and_drop_by 900, 100
  end

  def set_host_name (hostname)
    #require "pry"; binding.pry
    @browser.text_field(:name => 'smtp_url').set(hostname)
  end

  def set_port_number(portno)
    #require "pry"; binding.pry
    @browser.text_field(:name => 'port').set(portno)
  end

  def set_user_email(uemail)
    #require "pry"; binding.pry
    @browser.text_field(:name => 'username').set(uemail)
  end

  def set_enter_password(pword)
    #require "pry"; binding.pry
    @browser.text_field(:name => 'password').set(pword)
  end

  def set_from_address(faddress)
    #require "pry"; binding.pry
    @browser.textarea(:name => 'from_constant').set(faddress)
  end

  def set_to_address(taddress)
    #require "pry"; binding.pry
    @browser.textarea(:name => 'to_constant').set(taddress)
  end

  def set_enter_subject(subj)
    #require "pry"; binding.pry
    @browser.textarea(:name => 'subject_constant').set(subj)
  end

  def set_enter_msg(msg)
    #require "pry"; binding.pry
    @browser.div(:id => 'module-3').textarea(:name => 'message_phrase[]').set(msg)
  end

  def connect_email_module
    #require "pry"; binding.pry
    one = @browser.div(:id => 'module-2').div(:class => 'ui-draggable', :index => 1)
    two = @browser.div(:id => 'module-3').div(:class => 'mod-north').div(:class => 'ui-droppable')
    one.drag_and_drop_on two
  end

  def click_basic_tab
    #require "pry"; binding.pry
    b = @browser.div(:id => 'accordion').h3(:class => 'ui-accordion-header')
    b.click
    b.wait_until_present
  end

  def hang_up_module
    #require "pry"; binding.pry
    one = @browser.div(:class => 'ui-accordion-content').li(:class => 'ui-draggable')
    one.drag_and_drop_by 400, 200
  end

  def connect_hang_up_sms_module
    #require "pry"; binding.pry
    c = @browser.div(:id => 'module-2').div(:class => 'ui-draggable', :index => 0)
    d = @browser.div(:id => 'module-4').div(:class => 'mod-north').div(:class => 'ui-draggable')
    c.drag_and_drop_on d
  end

  def second_hang_up_module
    #require "pry"; binding.pry
    s = @browser.div(:class => 'ui-accordion-content').li(:class => 'ui-draggable')
    s.drag_and_drop_by 400, 400
  end

  def connect_hang_up_to_not_sent_email_module
    #require "pry"; binding.pry
    p = @browser.div(:id => 'module-3').div(:class => 'ui-draggable', :index => 1)
    q = @browser.div(:id => 'module-5').div(:class => 'mod-north').div(:class => 'ui-draggable')
    p.drag_and_drop_on q
  end

  def third_hang_up_module
    #require "pry"; binding.pry
    t = @browser.div(:class => 'ui-accordion-content').li(:class => 'ui-draggable')
    t.drag_and_drop_by 600, 400
  end

  def connect_hang_up_to_sent_email_module
    u = @browser.div(:id => 'module-3').div(:class => 'ui-draggable', :index => 0)
    v = @browser.div(:id => 'module-6').div(:class => 'mod-north').div(:class => 'ui-draggable')
    u.drag_and_drop_on v
  end

end