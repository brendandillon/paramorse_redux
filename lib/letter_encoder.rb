module ParaMorse

  class LetterEncoder

    def encode(letter)
      if ALPHABET.has_key?(letter.upcase )
        return ALPHABET[letter.upcase]
      else
        return ""
      end
    end

  end

end
