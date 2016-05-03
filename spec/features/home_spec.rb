feature 'Home' do

  scenario 'provides a full list of saved links' do
    Link.create(url: 'http://www.askjeeves.com', title: 'Ask Jeeves')

    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Ask Jeeves')
    end
  end
end
