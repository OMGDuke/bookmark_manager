feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'title',   with: 'Apple'
    fill_in 'url',     with: 'http://www.apple.co.uk/'
    fill_in 'tags',    with: 'tech'

    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('tech')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'title',   with: 'Sean Paul'
    fill_in 'url',     with: 'http://www.seanpaul.com'
    fill_in 'tags',    with: 'tech rubbish'

    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('tech', 'rubbish')
  end

end
