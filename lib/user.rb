require "pg"

class User
  attr_reader :username, :email, :password, :id

  def initialize(username:, email:, password:, id:)
    @username = username
    @email = email
    @password = password
    @id = id
  end

  def self.create(username:, email:, password:)
    connection = PG.connect(dbname: "abodenb")
    result = connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(username: result[0]["username"], email: result[0]["email"], id: result[0]["id"], password: result[0]["password"])
  end
end
