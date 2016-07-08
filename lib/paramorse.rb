require_relative "alphabet"
require_relative "file_reader"



class ParaMorse

def initialize
  @reader = FileReader.new
  @alphabet = Alphabet.new
end

end
