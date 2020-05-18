require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
    erb :index
  end

  get '/bookmarks/all' do
    @bookmarks = [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
     ]

     erb :bookmarks
  end 

  run! if app_file == $0
end
