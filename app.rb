require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'todo'
)

require './models/todo.rb'

get '/' do
  erb :index
end


get '/api/todos' do
  content_type :json
  todos = Todo.all
  return todos.to_json
end

get '/api/todos/:id' do
  content_type :json
  todos = Todo.params[:id].to_i
  return todos.to_json
end

post '/api/todos' do
  content_type :json
  todos = Todo.create(params[:todo])
  return todos.to_json
end

put '/api/todos/:id' do
  content_type :json
  todos = find(params[:id].to_i)
  todos.update(params[:todo])
  return todos.to_json
end

patch '/api/todos/:id' do
  content_type :json
  todos = find(params[:id].to_i)
  todos.update(params[:todo])
  return todos.to_json
end

delete '/api/todos/:id' do
  content_type :json
  todos = find(params[:id].to_i)
  todos.delete(params[:todo])
  {message: 'Its gone!'}.to_json
end
