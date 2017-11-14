def create_and_add_link(name, url, tag)
  visit '/links/new'
  fill_in :title, with: name
  fill_in :url, with: url
  fill_in :tag, with: tag
  click_button 'Add Link'
end