feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    add_new_link
    link = Link.first
    expect(link.tags.map(&:name)).to include 'search engine'
  end

before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
end

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end

  # scenario 'I can filter links by tag' do
  #   click_button 'filter'
  #   fill_in 'filter_by', with: 'search engine'
  #   click_button 'submit'
  #   expect(page).to_not have_content 'news'
  #   expect(page).to have_content 'search engine'
  # end

end
