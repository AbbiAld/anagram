require_relative 'reverse_letters'

def find_anagram(word)
	word_array = word.split(//)
	all_anagrams = []

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i]}
		new_word << word_array[i]
		new_word.push(remaining_letters)
		all_anagrams << new_word.join
	end

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i]}
		new_word << word_array[i]
		new_word.push(reverse_letters(remaining_letters))
		all_anagrams << new_word.join
	end

	return all_anagrams
end

def find_anagram_4(word) #SUPER wet...
	word_array = word.split(//)
	all_anagrams = []

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-1]}
		new_word << word_array[i] << word_array[i-1]
		new_word.push(remaining_letters)
		all_anagrams << new_word.join
	end

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-1]}
		new_word << word_array[i] << word_array[i-1]
		new_word.push(reverse_letters(remaining_letters))
		all_anagrams << new_word.join
	end	

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-2]}
		new_word << word_array[i] << word_array[i-2]
		new_word.push(remaining_letters)
		all_anagrams << new_word.join
	end

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-2]}
		new_word << word_array[i] << word_array[i-2]
		new_word.push(reverse_letters(remaining_letters))
		all_anagrams << new_word.join
	end

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-3]}
		new_word << word_array[i] << word_array[i-3]
		new_word.push(remaining_letters)
		all_anagrams << new_word.join
	end

	for i in 0...word.length
		new_word = []
		remaining_letters = word_array.select{|l| l != word_array[i] && l != word_array[i-3]}
		new_word << word_array[i] << word_array[i-3]
		new_word.push(reverse_letters(remaining_letters))
		all_anagrams << new_word.join
	end	

	return all_anagrams.uniq
end
