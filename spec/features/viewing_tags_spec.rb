feature 'Viewing tags' do

  before :each do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.codecademy.com', title: 'Codecademy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  end

  scenario 'I can filter my links by specific tags' do
    visit '/tags/education'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
      expect(page).to have_content 'Codecademy'
      expect(page).not_to have_content 'Google'
    end
  end


end
