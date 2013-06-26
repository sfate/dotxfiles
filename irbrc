class IRB::Settings
  attr_reader :enable_plugins, :enable_sql_logger, :failed_plugins, :plugins

  def initialize(options)
    @enable_plugins    = options[:enable_plugins]
    @enable_sql_logger = options[:enable_sql_logger]
    @failed_plugins    = []
    @plugins = options[:plugins]
  end
  
  def load_environment
    require 'rubygems'
    load_plugins
    load_sql_logger
  end

private
  def load_sql_logger
    if enable_sql_logger && (defined? Rails) && Rails.env.development?
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      ActiveRecord::Base.connection_pool.clear_reloadable_connections!
    end
  end
  
  def load_plugins
    return false unless enable_plugins
    plugins.each do |name, properties|
      properties = {} unless properties.class.to_s == 'Hash'
      properties[:loaded] = load_plugin(name.to_s)
    end
    unless failed_plugins.empty?
      mask = "\n\s\s*\s"
      error_prompt("Can't load gems:", "#{mask}#{failed_plugins.join(mask)}")
    end
    plugins.each do |name, properties|
      if properties[:loaded] && properties[:callback].class.to_s == 'Proc'
        begin
          properties[:callback].call
        rescue => ex
          error_prompt(ex.message)
        end
      end
    end
  end

  def load_plugin(plugin_name)
    require plugin_name
  rescue LoadError => ex
    failed_plugins << ex.message[/--\s(\w*)/,1]
    return false
  else
    return true
  end

  def error_prompt(reason, context=nil)
    puts "\n\e[31m[ERROR]\e[0m #{reason} #{context}\n\n"
  end
end

IRB::Settings.new( :enable_plugins    => true,
                   :enable_sql_logger => true,
                   :plugins => {
                     :awesome_print => {},
                     :pry => { :callback => Proc.new { Pry.start } }
}).load_environment
