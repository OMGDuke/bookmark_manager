feature 'creating a user' do
  scenario 'when creating a user, user count should go up by one' do
    expect{ new_user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Bob!')
    expect(User.first.username).to eq 'Bob'
  end
end
