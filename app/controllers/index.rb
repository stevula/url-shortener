get '/' do
  erb :index
end

post '/urls' do
  long_url_input = params[:long_url_input]
  Url.create(long_url: long_url_input)
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  goto = Url.find_by(short_url: params[:short_url])
  goto.update_click_count
  redirect "#{goto.long_url}"
end

