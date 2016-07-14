module ParaMorse

  class Decoder

    def decode(binary_input)
      words = binary_input.split("0000000")

      output = words.map do |word|
        word.split("000").map do |letter|
          ALPHABET.key(letter)
        end.join
      end.join(" ")

    end

  end

end
