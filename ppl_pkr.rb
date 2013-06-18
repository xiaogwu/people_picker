#!/usr/bin/env ruby

# TODO: 
# [x] 1. Read file into Array
# [x] 2. Get random names from array based on -n flag
# [x] 3. Create group of n people based on -g flag
# [x] 4. Create n groups based on -G flag
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

# Method to print groups
def output_groups(names_array, size_of_group)
	group_id = 1
	until names_array.size == 0 do
		puts "Group " + group_id.to_s
		puts "================="
		puts names_array.shift(size_of_group)
		puts
		group_id += 1
	end
end

def print_usage
	puts $0 + ": illegal option " + ARGV[0]
	puts "Usage: " + $0
	puts "       " + $0 + " -n [N]"
	puts "       " + $0 + " -g [N]"
	puts "       " + $0 + " -G [N]"
end

# flag logic
# Default bahavior is to print one random person
if ARGV.size == 0 then
	randomize(names)
	# Print first person from randomized array
	puts "Winner is " + names[0]
# Only one arg provided
elsif ARGV.size == 1 then
	puts "Please provide two arguments"
	print_usage
# Proper Flags specified
elsif ARGV.size == 2 then
	case ARGV[0]
	when '-n' then
		# Random number flag selected
		randomize(names)
		puts "Number of people specified exceed class size" if (ARGV[1].to_i - 1) > names.length
		puts ARGV[1] + " Random people from class" unless (ARGV[1].to_i - 1) > names.length
		puts "=============================" unless (ARGV[1].to_i - 1) > names.length
		puts names[0..ARGV[1].to_i - 1] unless (ARGV[1].to_i - 1) > names.length
	when '-g' then
		# Group of n flag selected
		randomize(names)
		size_of_group = ARGV[1].to_i
		output_groups(names, size_of_group)
	when '-G' then
		# n Groups flag selected
		randomize(names)
		size_of_group = (names.size / ARGV[1].to_i).ceil + 1
		output_groups(names, size_of_group)
	else
		# Flag error provide Usage
		print_usage
	end
end


