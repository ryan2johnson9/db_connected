require 'db_connected/db_connection_service'
module DbConnected
  def self.greet
    answer = 'Hello from the DbConnected gem'
    puts answer
    answer
  end
end
