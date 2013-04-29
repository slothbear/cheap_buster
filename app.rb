require 'sinatra'
require 'mail'
require_relative 'user.rb'
require_relative 'nextbus.rb'

get '/' do
  erb :index
end

post '/:phone' do |phone|
  Mail.deliver do
    to User.find(phone).email
    from 'cheapbuster@gmail.com'
  end
end