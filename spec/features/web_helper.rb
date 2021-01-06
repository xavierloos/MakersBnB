def add_listing1
  visit("/listings/new")
  fill_in("title", with: "testtitle")
  fill_in("description", with: "test description")
  fill_in("price", with: "100")
  click_button("Submit")
end

def add_listing2
  visit("/listings/new")
  fill_in("title", with: "testtitle2")
  fill_in("description", with: "test description2")
  fill_in("price", with: "200")
  click_button("Submit")
end

def wrong_email_login
  visit "/login"
  User.create(username: "test_username", email: "test@test.com", password: "test")
  fill_in "email", with: "wrong@test.com"
  fill_in "password", with: "test"
  click_button "Enter"
end

def wrong_password_login
  visit "/login"
  User.create(username: "test_username", email: "test@test.com", password: "test")
  fill_in "email", with: "test@test.com"
  fill_in "password", with: "wrong"
  click_button "Enter"
end

def login
  visit "/login"
  User.create(username: "test_username", email: "test@test.com", password: "test")
  fill_in "email", with: "test@test.com"
  fill_in "password", with: "test"
  click_button "Enter"
end
