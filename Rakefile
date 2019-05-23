require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

def options(config_file:  ENV['env']          || 'default',
            page_dir:     ENV['page_dir']     || 'default',
            data_suite:   ENV['data_suite']   || 'default',
            url:          ENV['url']          || 'default',
            report_file:  ENV['report_file']  || './reports/index.html',
            client:       ENV['client']       || 'default',
            users:        ENV['users']        || 'default',
            tags:         ENV['tags']         || nil)

  "FIG_NEWTON_FILE=#{config_file}.yml page_dir=#{page_dir} data_suite=#{data_suite} url=#{url} --out=#{report_file} users=#{users} client=#{client} #{('--tags ' + tags) unless tags.nil?}"
end

def create(name:, options:, profile:)
  Cucumber::Rake::Task.new(name) do |t|
    t.profile = profile.to_s
    t.cucumber_opts = options
  end
end

desktop_functional_options = options(url: 'default', users: 'default')
mobile_functional_options = options(url: 'default', users: 'default', page_dir: 'mobile', data_suite: 'mobile', client: 'iphone5')

namespace :test do
  namespace :mobile do
    create(name: 'functional', profile: 'functional', options: mobile_functional_options)
    multitask all: ['test:mobile:functional']
  end

  namespace :desktop do
    create(name: 'functional', profile: 'functional', options: desktop_functional_options)
    multitask all: ['test:desktop:functional']
  end

  task all: ['test:desktop:all']
end

namespace :db do
  require_relative 'features/support/database'
  db_config = YAML.load_file("config/environments/#{ENV['env'] || 'default'}.yml")['db']
  db = Database.new(db_config)

  desc 'rake e2e:db:record : Dumps the database and compresses dump file'
  task :record do
    db.record
  end

  desc 'Decompresses dump file and restores database'
  task :play do
    db.play
  end
end

task(default: 'test:all')
