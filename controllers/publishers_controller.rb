require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb ( :"publishers/index" )
end

get '/publishers/new/?' do
  erb ( :"publishers/new" )
end

get '/publishers/:id/delete' do
  @publisher = Publisher.find(params['id'].to_i)
  erb ( :"publishers/delete")
end

get '/publishers/:id' do
  @publishers = Publisher.find(params['id'].to_i)
  erb(:"publishers/show")
end

post '/publishers/:id/delete' do
  publisher = Publisher.find(params[:id])
  publisher.delete()
  redirect to '/publishers'
end

post '/publishers/:id' do
  Publisher.new(params).update
  redirect to '/publishers'
end

post '/publishers' do
  publisher = Publisher.new( params )
  publisher.save()
  redirect to '/publishers'
end
