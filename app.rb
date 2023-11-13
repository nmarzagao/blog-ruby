require 'sinatra'
require './posts.rb'

configure do
    set :port, 8080  
end

posts = Posts.new

posts.insert 'First Post', 'This is the first Post'
posts.insert 'Second Post', 'This is the second Post'

get '/' do
    erb :index, locals: { posts: posts.get_posts }
end
