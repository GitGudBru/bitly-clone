get '/' do
  erb :"static/index"
end

post '/urls' do
 url = Url.create(
    original_url: params[:long_url]
                  )
  erb :"static/index"
end

# i.e. /q6bda
get '/:short_url' do
	data = Url.where(shortened_url: params[:short_url])[0]
	data.save!
     p data
    redirect data.original_url
end