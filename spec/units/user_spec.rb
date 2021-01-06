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
    before do
      User.create(username: "test_user", email: "test@test.com", password: "test_password")
    end
    it "checks the user exists" do
      auth = User.authentificate(email: "test@test.com", password: "test_password")
      expect(auth.username).to eq "test_user"
      expect(auth.email).to eq "test@test.com"
    end
    it "checks the user is nil" do
      expect(User.authentificate(email: "t@test.com", password: "test_password")).to be_nil
    end
  end
end
