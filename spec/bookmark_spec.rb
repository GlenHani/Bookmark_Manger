require './lib/bookmark'
require './spec/setup_test_database'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      connection = PG.connect(dbname: 'bookmark_manager_test')

      setup_test_database



      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

  
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end
end
