require "user"
require "db_helpers"
RSpec.describe User do
  describe ".create" do
    it "creates a new user" do
      user = User.create(username: "test_user", email: "test@test.com", password: "test_password")
      persisted_data = persistent_data(table: "users", id: user.id)

      expect(user).to be_kind_of User
      expect(user.username).to eq "test_user"
      expect(user.email).to eq "test@test.com"
      expect(user.id).to eq persisted_data[0]["id"]
    end
  end
  describe ".authentificate" do
    it "checks the user exists" do
      # user = User.create(username: "test_user", email: "test@test.com", password: "test_password")
      auth = User.authentificate(email: "test@test.com", password: "test_password")
      expect(auth.email).to eq "test@test.com"
    end
  end
end
