require 'sinatra'
require 'sinatra/activerecord'

class ItsThatDeep < Sinatra::Base
	set :database_file, "config/database.yml"

	register Sinatra::ActiveRecordExtension

	get '/' do
		@musings = Musing.all
		erb :index
	end

	post '/' do 
		musing = Musing.new(title: params[:title], text: params[:text])

		if musing.save
			flash[:notice] = "Thanks for your interesting observation"
			puts "saved"
		else
			flash[:error] = "There was a problem saving your interesting observation"
			puts "not saved"
		end

		redirect_to '/'
		erb :index
	end

end