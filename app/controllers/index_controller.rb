get '/' do
	erb :index
end

post '/' do 
	@word = params[:word]
	redirect "/anagrams/#{@word}"
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.check_words(@word)
	erb :show
end