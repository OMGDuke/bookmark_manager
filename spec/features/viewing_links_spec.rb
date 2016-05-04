feature 'viewing links' do

  before (:each) do
    Link.create(url: 'http://www.omgduke.com', title: 'Alex', tags: [Tag.first_or_create(name: 'blog')])
    Link.create(url: 'http://www.pixelandpage.co.uk', title: 'Maggie', tags: [Tag.first_or_create(name: 'blog')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  end

  scenario 'user can see a list of links on the homepage' do
    Link.create(url: 'http://www.omgduke.com', title: 'Alex')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Alex')
    end
  end

  scenario 'I can filter links by tag' do
    visit '/tags/blog'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Google')
      expect(page).not_to have_content('Bubbles')
      expect(page).to have_content('Alex')
      expect(page).to have_content('Maggie')
    end
  end
end
