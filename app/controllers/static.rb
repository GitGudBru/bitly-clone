get '/' do
	  @urls = Url.last(3).reverse

  erb :"static/index"
end


post '/urls' do
  # add url to database
  @url = Url.create(original_url: params[:long_url])
       if @url.save
    redirect '/'
  else
    @error = @url.errors.full_messages
    @urls = Url.last(3).reverse
  erb :"static/index"
      end

      #AJAX
      # @url = Url.new(params[:url])
      # if @url.save
      # 	return @url.to_json
      # else
      # 	status 400
      # 	return @url.to_json
      # end
  end


get '/:short_url' do
  # redirect to appropriate "long" URL
  # @url = Url.find_by(shortened_url: params[:short_url])
  data = Url.where(shortened_url: params[:short_url])[0]
  # data =  Url.find_by(short_url: params[:short_url])
  redirect data.original_url
end