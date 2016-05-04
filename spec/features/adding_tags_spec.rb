feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in('title',   with: 'Apple')
    fill_in('url',     with: 'http://www.apple.co.uk/' )
    fill_in( 'tags',    with: 'tech')

    click_button('Add')
    link = Link.first
    expect(link.tags.map(&:name)).to include('tech')
  end
end
