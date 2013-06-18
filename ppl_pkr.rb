#!/usr/bin/env ruby

# TODO: 
# [x] 1. Read file into Array
# 2. Get random names from array based on -n flag
# 3. Create n arrays based on -g flag
# Bonus 1 - Store/retrieve array in a json file
# Bonus 2 - History

filename = 'Names.txt'
names = []
# Open filename in read mode and for each line push into array
File.open(filename, 'r').each_line do |line|
	names << line.strip
end

# Method to shuffle array in place
def randomize(names_array)
	names_array.shuffle!
end

puts names


