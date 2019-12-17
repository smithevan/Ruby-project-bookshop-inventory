require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/author.rb' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/book.rb' )
require_relative( '../models/authors_books.rb' )
also_reload( '../models/*' )

get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end

get '/authors/new' do
  erb ( :"authors/new" )
end

get '/authors/:id' do
  @authors = Author.find(params['id'].to_i)
  erb(:"authors/show")
end

post '/authors' do
  author = Author.new( params )
  author.save()
  redirect to '/authors'
end
