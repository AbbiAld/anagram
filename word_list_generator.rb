

def three_word_list
	three_letter_words = []
	words = File.readlines("sowpods.txt", chomp: true)
	words.each do |word|
		if word.length == 5
			three_letter_words << word.strip
		end
	end
	return three_letter_words
end


def four_word_list
	four_letter_words = []
		words = File.readlines("sowpods.txt", chomp: true)
	words.each do |word|
		if word.length == 6
			four_letter_words << word.strip
		end
	end
	return four_letter_words
end

