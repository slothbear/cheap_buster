require 'sinatra'

get '/' do
  '<p>
    Read more about
    <a href="http://github.com/slothbear/cheap_buster">Cheap Buster</a>
  </p>'
end

post '/:phone' do |phone|
  Mail.deliver do
    to User.find(phone).email
    from 'cheapbuster@gmail.com'
  end
end