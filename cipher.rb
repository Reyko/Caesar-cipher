class Cipher 
  attr_accessor :text, :shift_factor

  def initialize(text, shift_factor = nil)
    @text = text
    @shift_factor = shift_factor
  end

  def encrypt
    text.split("").map do |letter| 
      if letter == " "
        " "
      else
        encrypted_letter = find_encrypted_letter(letter)
        upcase?(letter) ? encrypted_letter.upcase : encrypted_letter
      end
    end.join("")
  end

  def letter_index(letter)
    alphabet.index(letter.downcase).to_i + shift_factor  
  end

  def find_encrypted_letter(letter)
    letter_index = letter_index(letter)
    letter_index >= alphabet.length ? alphabet[letter_index - alphabet.length] : alphabet[letter_index]
  end

  def upcase?(letter)
    letter.upcase == letter
  end

  private
  def alphabet
    ('a'..'z').to_a
  end
end
