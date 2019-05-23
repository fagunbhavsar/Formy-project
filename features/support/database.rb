class Database
  def initialize(config)
    @config = config;
  end

  def record
    execute "pg_dump --format=plain -d #{@config['database']} -h #{@config['host']} -O > #{db_file_path}"
    execute "gzip -f #{db_file_path}"
  end

  def play
    execute "gzip -k -d -f #{db_file_path}.gz"
    execute "psql -d #{@config['database']} -h #{@config['host']}  -a -q -f -v ON_ERROR_STOP=1 #{before_db_path}"
    execute "psql -d #{@config['database']} -h #{@config['host']}  -a -q -f -v ON_ERROR_STOP=1 #{db_file_path}"
  end
  
  private
  
  def execute cmd
    puts cmd
    system cmd
  end
  
  def before_db_path
    "data/before-db.sql"
  end

  def db_file_path
    "data/db.sql"
  end

end
