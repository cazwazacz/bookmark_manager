require './lib/link.rb'


feature 'index' do
  scenario 'there is a link' do
    visit ('/')
    link = Link.create(url: 'https://www.bbc.co.uk')
    expect(page).to have_link('', href: 'https://www.bbc.co.uk')
  end
end
