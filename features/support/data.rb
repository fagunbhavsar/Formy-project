class DataSuite

  def initialize(path)
    @path = path
  end

  def load(feature_path, scenario_name)
    file = "#{@path}/#{feature_path}.feature.yml"
    return Hash.new unless File.exist?(file)
    data = YAML.load_file(file)
    data[scenario_name] unless (data == false)
  end

  def fromFile(feature_path, file_name)
    file = "#{@path}/#{feature_path}/#{file_name}.yml"
    YAML.load_file(file)
  end

end