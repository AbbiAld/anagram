require_relative 'reverse_letters'

#def find_anagram(word)
#	word_array = word.split(//)
#	anagrams = word_array.permutation.to_a
#	anagrams.map! {|word| word.join('').upcase}
#	anagrams.uniq
#end

def find_anagram_hard(word) #works for three and four letter words
	word_array = word.split(//)
	all_anagrams = []

	for i in 0...word.length
		
		#keep letter at index and one other letter, then add the other two letters after, in original and reverse order
		remaining_letters = word_array.select{|l| l.index != word_array[i].index && l != word_array[i-1].index}
		all_anagrams << word_array[i] + word_array[i-1] + remaining_letters.join
		all_anagrams << word_array[i] + word_array[i-1] + reverse_letters(remaining_letters).join

		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-2]}
		all_anagrams << word_array[i] + word_array[i-2] + remaining_letters.join
		all_anagrams << word_array[i] + word_array[i-2] + reverse_letters(remaining_letters).join

		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-3]}
		all_anagrams << word_array[i] + word_array[i-3] + remaining_letters.join
		all_anagrams << word_array[i] + word_array[i-3] + reverse_letters(remaining_letters).join

	end	

	#weed out any repeats, or words that are too long (makes it return correctly for 3-letter words)
	all_anagrams.uniq.select {|anagram| anagram.length == word.length}
end


def find_anagram(word)
	letters = word.upcase.split(//)
	unique_letters = letters.uniq
	search_params = []
	unique_letters.each do |letter|
		count = letters.count(letter)
		search_param = "%#{letter}%" * count
		search_params << search_param
	end
	word_length = word.length
	possible_words = Word.where("length(text) = #{word_length}")
	search_params.each do |search_term|
		possible_words = possible_words.where("text like ?", search_term)
	end
	real_words = []
	possible_words.each do |record|
		real_words << record.text.downcase
	end
	real_words
end

