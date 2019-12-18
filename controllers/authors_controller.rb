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
  @publishers = Publisher.all()
  erb ( :"authors/new" )
end

get '/authors/:id/delete' do
  @author_delete = Author.find(params['id'].to_i)
  erb ( :"authors/delete")
end

get '/authors/:id' do
  @publishers = Publisher.all()
  @authors = Author.find(params['id'].to_i)
  erb(:"authors/show")
end

post '/authors/:id/delete' do
  author = Author.find(params[:id])
  author.delete()
  book = Book.find(params[:id])
  book.delete()
  redirect to '/authors'
end

post '/authors/:id' do
  Author.new(params).update
  redirect to '/authors'
end

post '/authors' do

  author = Author.new( params )
  author.save()
  redirect to '/authors'
end
