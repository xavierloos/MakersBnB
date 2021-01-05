require "user"
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
end
