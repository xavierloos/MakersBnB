require "user"
require 'db_helpers'
RSpec.describe User do
  describe "New user" do
    it "creates a new user" do
      newuser = instance_double(User)
      allow(newuser).to receive(:username).and_return("test")
      allow(newuser).to receive(:email).and_return("test@test.com")
      allow(newuser).to receive(:password).and_return("test")
      expect(newuser.username).to eq "test"
      expect(newuser.email).to eq "test@test.com"
      expect(newuser.password).to eq "test"
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'test_user', email: 'test@test.com', password: 'test_password')
      persisted_data = persistent_data(table: 'users', id: user.id)
      p user.id
      p persisted_data
      expect(user).to be_kind_of User
      expect(user.username).to eq 'test_user'
      expect(user.email).to eq 'test@test.com'
      expect(user.id).to eq persisted_data[0]['id']
    end
  end
end
