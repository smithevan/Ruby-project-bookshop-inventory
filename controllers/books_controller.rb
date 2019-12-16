require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/book.rb' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/author.rb' )
also_reload( '../models/*' )

get '/books' do
  @books = Book.all()
  erb ( :"books/index" )
end

get '/books/new' do
  @books = Book.all()
  erb ( :"books/new" )
end

get '/books/:id' do
  @books = Book.find(params['id'].to_i)
  erb(:"books/show")
end

post '/books/:id' do
  Book.new(params).update
  redirect to '/books'
end
