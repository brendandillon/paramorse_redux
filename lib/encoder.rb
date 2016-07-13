module ParaMorse

  class Encoder

    def encode(phrase)
      phrase.upcase.each_char.map do |letter|
        ALPHABET[letter]
      end.join("000")
    end
  end

end
