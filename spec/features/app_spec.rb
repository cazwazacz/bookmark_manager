feature 'index' do

  scenario 'there is a link' do
    link = Link.create(url: 'https://www.bbc.co.uk', title: 'BBC Website')
    visit ('/links')
    expect(page).to have_link('BBC Website', href: 'https://www.bbc.co.uk')
    DatabaseCleaner.clean
  end
  
end

