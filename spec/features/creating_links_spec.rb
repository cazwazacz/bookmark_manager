feature 'Creates links' do
  scenario 'Create new link' do
    visit '/links/new'
    fill_in :title, with: 'CNN Website'
    fill_in :url, with: 'http://edition.cnn.com'
    click_button 'Add Link'
    expect(page).to have_content 'CNN Website has been added'
  end
end
