get '/' do
	erb :index
end

post '/' do 
	@word = params[:word]
	redirect "/anagrams/#{@word}"
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	if @anagrams.empty?
		@error = "Sorry! There are no anagrams for that word."
	end
	erb :show
end