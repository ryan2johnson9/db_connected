class DbConnectionService

  def initialize(logger: $stdout, establish_retry_wait_seconds: 7)
    @logger = logger
    @establish_retry_wait_seconds = establish_retry_wait_seconds
  end

  def ensure_db_connection
    established = establish_connection
    return true if established
    pause @establish_retry_wait_seconds
    return try_establish_connection
  end

  def try_establish_connection
    established = false
    while !established
      warn "LOST CONNECTION TO DB - trying to establish connection in #{@establish_retry_wait_seconds} seconds"
      pause @establish_retry_wait_seconds
      established = establish_connection
    end
    return true
  end

  def establish_connection
    begin
      ActiveRecord::Base.establish_connection
      ActiveRecord::Base.connection
      return ActiveRecord::Base.connected?
        # return true if res.is_a?(ActiveRecord::ConnectionAdapters::ConnectionPool)
    rescue PG::UnableToSend
      return false
    rescue PG::ConnectionBad
      return false
    end
  end
  private :establish_connection

  def pause num_seconds
    sleep num_seconds
  end
  private :pause

  def warn message
    puts "OI"
    if @logger.respond_to?(:warn)
      @logger.warn message
    elsif @logger.respond_to?(:puts)
      @logger.puts message
    else
      puts message
    end
  end
  private :warn
end
