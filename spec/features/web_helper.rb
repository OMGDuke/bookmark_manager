def add_new_link
  visit '/links/new'
  fill_in 'title', with: 'Google'
  fill_in 'url', with: 'www.google.com'
  fill_in 'tags', with: 'search engine'
  click_button 'submit'
end

def add_another_link
  visit '/links/new'
  fill_in 'title', with: 'BBC'
  fill_in 'url', with: 'www.bbc.co.uk'
  fill_in 'tags', with: 'news'
  click_button 'submit'
end
