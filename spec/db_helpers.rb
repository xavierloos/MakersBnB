require "pg"

def persistent_data(table:, id:)
  connection = PG.connect(dbname: "abodenb")
  connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
end
