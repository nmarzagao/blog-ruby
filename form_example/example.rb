# app.rb
require 'sinatra'

# Set the path for the homepage
get '/' do
  erb :index
end

# Handle the form submission
post '/greet' do
  # Retrieve the name from the form
  name = params[:name]
  
  # Render the greeting page with the provided name
  erb :greet, locals: { name: name }
end
