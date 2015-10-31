require 'minitest/spec'
require 'minitest/autorun'
require './cipher.rb'

describe "cipher" do
  before do
    @cipher = Cipher.new("Hello World")
  end

  describe "attributes" do
    describe "#text" do
      it "should respond to text" do
        expect(@cipher).must_respond_to(:text)
      end

      it "should return the cipher's text" do
        expect(@cipher.text).must_equal("Hello World")
      end
    end

    describe "#shift_factor" do
      it "should respond to shift_factor" do
        expect(@cipher).must_respond_to(:shift_factor)
      end

      it "should return the cipher's shift factor" do
        @cipher.shift_factor = 4
        expect(@cipher.shift_factor).must_equal(4)
      end
    end
  end

  describe "#alphabet" do
    it "should return the alphabet as an array" do
      expect(@cipher.send(:alphabet)).must_equal(
        ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
         'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
      )
    end
  end

  describe "#upcase?" do
    it "should return true if letter is uppercase" do
      expect(@cipher.upcase?("A")).must_equal(true)
    end

    it "should return false if letter is downcase" do
      expect(@cipher.upcase?("a")).must_equal(false)
    end
  end

  describe "#encrypt" do
    it "should respond to encrypt" do
      expect(@cipher).must_respond_to(:encrypt)
    end

    describe "with shift factor 4" do
      before do
        @cipher.shift_factor = 4
      end

      it "should return the right encrypted text" do
        expect(@cipher.encrypt).must_equal("Lipps Asvph")
      end
    end

    describe "with shift factor 2" do
      before do
        @cipher.shift_factor = 2
      end

      it "should return the right encrypted text" do
        expect(@cipher.encrypt).must_equal("Jgnnq Yqtnf")
      end
    end
  end

  describe "#letter_index" do
    before do
      @cipher.shift_factor = 4
    end

    it "should respond to letter_index" do
      expect(@cipher).must_respond_to(:letter_index)
    end

    it "should return the index of the shifte factored letter" do
      expect(@cipher.letter_index('H')).must_equal(11)
    end
  end

  describe "#find_encrypted_letter" do
    before do
      @cipher.shift_factor = 4
    end

    it "should respond to find_encrypted_letter" do
      expect(@cipher).must_respond_to(:find_encrypted_letter)
    end

    it "should return the correct encrypted letter from the alphabet" do
      expect(@cipher.find_encrypted_letter('Z')).must_equal('d')
    end
  end
end


