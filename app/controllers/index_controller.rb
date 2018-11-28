get '/' do
	erb :index
end

post '/' do 
	@word = params[:word]
	def empty_input?(input)
		if input.empty?
			raise Exception.new("Oops! Looks like your didn't enter a word. Please enter a word!")
		end
	end
	begin 
		!empty_input?(@word)
		redirect "/anagrams/#{@word}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	if @anagrams.empty?
		@error = "Sorry! There are no anagrams for that word."
	end
	erb :show
end