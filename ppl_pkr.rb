#!/usr/bin/env ruby

# TODO: 
# [x] 1. Read file into Array
# [x] 2. Get random names from array based on -n flag
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

# flag logic
case ARGV[0]
when '-n' then
	# Random number flag selected
	randomize(names)
	puts "Number of people specified exceed class size" if (ARGV[1].to_i - 1) > names.length
	puts names[0..ARGV[1].to_i - 1] unless (ARGV[1].to_i - 1) > names.length
when '-g' then
	# Group of n flag selected"
	randomize(names)
	size_of_group = ARGV[1].to_i
	group_id = 1
	until names.size == 0 do
		puts "Group " + group_id.to_s
		puts "================="
		puts names.shift(size_of_group)
		puts
		group_id += 1
	end	
else
	puts "No flag provided, provide usage"
end

#puts names


