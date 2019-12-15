require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/author.rb' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/book.rb' )
also_reload( '../models/*' )

get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end
