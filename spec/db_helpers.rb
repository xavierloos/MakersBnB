require "pg"
require "./lib/db_test_connection_helper"

def persistent_data(table:, id:)
  connection = connect_to_database
  connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
end
