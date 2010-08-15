module RunTests
  
  module_function
  
  def compare(name)
    result = `./gtm < input/#{name}.scala ../Syntaxes/Scala.tmLanguage`.split("\n")
    expected = `cat output/#{name}.output`.split("\n")

    booleans = Array.new(result.count) { |index|
      result[index] == expected[index]
    }
    booleans.uniq.count == 1
  end
  
end

## This tests a simple class definition
puts "Simple class: " + RunTests.compare("class").to_s

## This tests a simple method definition
puts "Simple method: " + RunTests.compare("method").to_s