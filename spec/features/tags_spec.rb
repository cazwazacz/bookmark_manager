feature 'tags' do
  scenario 'filter links by tag' do
    create_and_add_link('BBC', 'https://www.bbc.co.uk', 'news')
    create_and_add_link('Sports', 'https://www.sports.co.uk', 'bubbles')
    create_and_add_link('Pair of bubbles', 'https://www.pairofbubbles.co.uk', 'bubbles')
    visit '/tags/bubbles'
    expect(page).to have_content('Sports', 'Pair of bubbles')
    expect(page).not_to have_content('BBC')
  end
end