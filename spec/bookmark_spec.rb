require './lib/bookmark'
require 'pg'


RSpec.describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')


      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'

    end
  end


  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark' do

      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      changed  = Bookmark.update(id: bookmark.id, title: 'Makers Test', url: 'http://www.makersacademy1.com')
      expect(changed).to be_a Bookmark
      expect(changed.id).to eq bookmark.id
      expect(changed.title).to eq 'Makers Test'
      expect(changed.url).to eq 'http://www.makersacademy1.com'
    end
  end


end
