feature 'Creating links' do
  scenario 'I can create a new ink' do
    visit 'links/new'
    fill_in 'url', with: 'http:/pixelandpage.co.uk'
    fill_in 'title', with: 'Maggie'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Maggie')
    end
  end
end
