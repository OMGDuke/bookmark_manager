feature 'creating a user' do
  scenario 'when creating a user, user count should go up by one' do
    expect{ new_user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Bob!')
    expect(User.first.username).to eq 'Bob'
  end
end

feature 'User sign up' do
  scenario 'requires a matching confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
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
end
