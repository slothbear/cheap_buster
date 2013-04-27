require 'sinatra'

get '/' do
  '<p>
    Read more about
    <a href="http://github.com/slothbear/cheap_buster">Cheap Buster</a>
  </p>'
end

post '/:telephone' do
  "Getting predictions for #{params['telephone']}"

  Mail.deliver do
    to 'farbot@example.com'
    from 'cheapbuster@gmail.com'
  end
end