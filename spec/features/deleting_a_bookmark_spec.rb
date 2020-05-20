feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.glentest.com', title: 'Test')
    visit('/bookmarks')
    expect(page).to have_link('Test', href: 'http://www.glentest.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test', href: 'http://www.glentest.com')
  end
end
