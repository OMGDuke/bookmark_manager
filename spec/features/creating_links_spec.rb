feature 'Adding new links' do
  scenario 'I can add a new link to the list using a form' do

    visit '/links/new'
    fill_in('title', with: 'AOL')
    fill_in('url', with: 'www.AOL.com')
    click_button('Add')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('AOL')
    end
  end
end