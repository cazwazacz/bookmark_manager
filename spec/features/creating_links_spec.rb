feature 'Creates links' do
  scenario 'Create new link' do
    visit '/links/new'
    fill_in :title, with: 'CNN Website'
    fill_in :url, with: 'http://edition.cnn.com'
    fill_in :tag, with: 'news'
    click_button 'Add Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
    DatabaseCleaner.clean
  end
end
