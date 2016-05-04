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

  scenario 'I can add multiple tags' do
    visit '/links/new'
    fill_in 'url', with: 'http://pixelandpage.co.uk'
    fill_in 'title', with: 'Maggie'
    fill_in 'tags', with: 'coder ruby awesome'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('coder', 'ruby', 'awesome')
  end
end
