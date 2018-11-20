file = File.new('db/sowpods.txt')
file.each_line do |line|
    Word.create!(text: line.strip)
end