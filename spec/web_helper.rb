def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'noah@gmail.com'
  fill_in :password, with: 'alex'
  click_button 'Sign up'
end
