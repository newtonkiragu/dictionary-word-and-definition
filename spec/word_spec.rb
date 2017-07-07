require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#name') do
    it("returns the name of the word") do
      test_word = Word.new("Bob")
      expect(test_word.name()).to(eq("Bob"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("Bob")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#definition') do
    it("initially returns an empty array of definitions for the word") do
      test_word = Word.new("Bob")
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("Bob")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("Bob").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("Bob")
      test_word.save()
      test_word2 = Word.new("Jane")
      test_word2.save()
      binding.pry
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#add_definition')do
    it("adds a new definition to a word")do
      test_word = Word.new("Bob")
      test_definition = Definition.new("an english name to mean monkey")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
