require "pg"
require "db_test_connection_helper"

class User
  attr_reader :username, :email, :password, :id

  def initialize(username:, email:, password:, id:)
    @username = username
    @email = email
    @password = password
    @id = id
  end

  def self.create(username:, email:, password:)
    connection = connect_to_database
    result = connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(username: result[0]["username"], email: result[0]["email"], id: result[0]["id"], password: result[0]["password"])
  end
  def self.authentificate(email:, password:)
    connection = connect_to_database
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}';")
    return unless result.any?
    User.new(
      id: result[0]["id"],
      username: result[0]["username"],
      email: result[0]["email"],
      password: result[0]["password"],
    )
  end
  def self.find(id:)
    connection = connect_to_database
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}';")
    User.new(
      id: result[0]["id"],
      username: result[0]["username"],
      email: result[0]["email"],
      password: result[0]["password"],
    )
  end
end
