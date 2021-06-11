#!/usr/bin/ruby

require 'json'
require 'puma'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/json'
require './models/book'


class BooksApp < Sinatra::Base
  mime_type 'application/json'

  register Sinatra::ActiveRecordExtension
  set :database_file, 'config/database.yml'

  configure do
    set :port, 8080
    set :bind, '0.0.0.0'
  end

  before do
    content_type :json
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def no_data!
    status 204
    json :message => "no data"
  end

  get '/' do
    {'status' => ENV['HOSTNAME']+ ' is healthy'}.to_json
  end

  get '/books' do
    @books = Book.all
    json @books
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    json @book
  end

  post '/books' do
    new_book = MultiJson.load(request.body.read)
    @book = Book.new( new_book )
    if @book.save
      json @book
    else
      no_data!
    end
  end

  put '/books/:id' do
    @book = Book.find_by_id params[:id]
    if !@book
      no_data!
    else
      update_employee = MultiJson.load request.body.read
      if @book.update(update_employee)
        json @book
      else
        json @book.errors.messages
      end
    end
  end

  delete '/books/:id' do
    Book.destroy(params[:id])
  end

  run! if $0 == app_file
end