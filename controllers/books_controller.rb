require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/book.rb' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/authors_books.rb' )
also_reload( '../models/*' )

get '/books' do
  @books = Book.all()
  erb ( :"books/index" )
end

get '/books/new' do
  @authors = Author.all()
  @authors_books = Authors_books.all()
  erb ( :"books/new" )
end

get '/books/:id/delete' do
  @books = Book.find(params['id'].to_i)
  erb ( :"books/delete")
end

get '/books/:id' do
  @books = Book.find(params['id'].to_i)
  erb(:"books/show")
end

post '/books/:id/delete' do
  book = Book.find(params[:id])
  book.delete()
  redirect to '/books'
end

post '/books/:id' do
  Book.new(params).update
  redirect to '/books'
end

post '/books' do
  books = Book.new( params )
  books.save()
  params[:book_id] = books.id
  authors_books = Authors_books.new(params)
  authors_books.save()
  redirect to '/books'
end
