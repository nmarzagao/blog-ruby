require 'sinatra'
require './posts.rb'

configure do
    set :port, 8080  
end

posts = Posts.new

get '/' do
    erb :index, locals: { posts: posts.get_posts }
end

post '/' do
    posts.insert params[:title], params[:content]

    erb :index, locals: { posts: posts.get_posts }
end

get '/create_post' do
    erb :create_post
end
