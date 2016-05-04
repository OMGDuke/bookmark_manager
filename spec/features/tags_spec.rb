feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: 'search engine'

    click_button 'submit'
    link = Link.first
    p link
    expect(link.tags.map(&:name)).to include 'search engine'
  end

end
