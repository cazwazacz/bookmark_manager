feature 'index' do
  scenario 'there is a link' do
    visit ('/links')
    link = Link.create(url: 'https://www.bbc.co.uk', title: 'BBC Website')
    expect(page).to have_link('BBC Website', href: 'https://www.bbc.co.uk')
  end
end
