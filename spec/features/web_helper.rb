def add_new_link
  visit '/links/new'
  fill_in 'title', with: 'Google'
  fill_in 'url', with: 'www.google.com'
  fill_in 'tags', with: 'search engine'
  click_button 'submit'
end

def add_multiple_tags
  visit '/links/new'
  fill_in 'title', with: 'BBC'
  fill_in 'url', with: 'www.bbc.co.uk'
  fill_in 'tags', with: 'news ' 'media ' 'puppies'
  click_button 'submit'
end

def new_user
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: 'Bob'
  fill_in :password, with: '123456'
  click_button 'submit'
end

def sign_up(username: 'bob',
            password: '12345',
            password_confirmation: '12345')
  visit '/users/new'
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'submit'
end
