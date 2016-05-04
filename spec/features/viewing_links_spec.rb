feature 'viewing links' do
  scenario 'user can see a list of links on the homepage' do
    Link.create(url: 'http://www.omgduke.com', title: 'Alex')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Alex')
    end
  end
end
