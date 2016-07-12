require "pry"
require_relative "alphabet"
require_relative "decoder"
require_relative "encoder"
require_relative "letter_decoder"
require_relative "letter_encoder"
require_relative "stream_decoder"
require_relative "queue"

module ParaMorse

end

#streamer will receive one character at a time
#will store in an Array
#when decode is called, it will either return the word (or letter)
#or it wil return an error message "it is not a word and will ask another input"
