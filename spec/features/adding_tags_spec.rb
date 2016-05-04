feature 'creating tags' do
  scenario 'user can add tags to links' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.omgduke.com'
    fill_in 'title', with: 'Alex'
    fill_in 'tags', with: 'coder'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('coder')
  end
end
