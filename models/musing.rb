class Musing

	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :text, Text
	property :created_at, DateTime
	
end