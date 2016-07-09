require_relative "alphabet"
require_relative "file_reader"



module ParaMorse

class Queue

def initialize
  @reader = FileReader.new
  @alphabet = Alphabet.new
end



end

end
