module ParaMorse

  class LetterEncoder

    def encode(letter)
      ALPHABET[letter.upcase]
    end
  end

end
