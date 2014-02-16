require 'ruby-prof'

# Profile the code
result = RubyProf.profile do
  puts "Hello world."
end

# Print a graph profile to text
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
