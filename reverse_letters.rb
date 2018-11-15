def reverse_letters(array)
	length = array.length
	new_array = Array.new(2)
	array.each_with_index {|letter, index|
		new_array[(length - index - 1)] = letter
	}
	return new_array
end
