require 'sinatra'
require 'httparty'


configure do
  set :appid, "833EA58AD00D351A7C678D753"
end

get '/' do
	erb :index
end

get '/arrivals' do
	arrivals = HTTParty.get("http://developer.trimet.org/ws/V1/arrivals?locids=#{params[:id]}&appid=#{options.appid}")
	@parsed_arrivals = arrivals['resultSet']['arrival']
	
	erb :arrivals, :layout => false
end