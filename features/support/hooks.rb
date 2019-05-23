Before do
  data_dir = FigNewton.data.send(ENV['data_suite'])
  @data_suite = DataSuite.new(data_dir)
  users_file = FigNewton.users.send(ENV['users'])
  #@users = Users.new(YAML.load_file(users_file))
  client = FigNewton.clients.send(ENV['client'])

  @browser = Driver.get(client)
  @browser.driver.manage.timeouts.implicit_wait = 30
  @db = Database.new(FigNewton.db)
  # ($db_reset = true && @db.play) unless $db_reset
end

After do
  @browser.close
end

Before do |scenario|
  feature_path = scenario.feature.all_locations.first.to_s.split('features/')[1].split(':').first.strip.split('.feature').first.strip
  data_tag = scenario.tags.find { |tag| tag.name.start_with? '@data' }
  file_name = data_tag.name.split('(')[1].split(')')[0].delete("'").delete('"') if data_tag
  @data = file_name ? @data_suite.fromFile(feature_path, file_name) : @data_suite.load(feature_path, scenario.name)
  @scenario_tags = scenario.source_tag_names
end

Before('@cleandb') do
  @db.restore
end
