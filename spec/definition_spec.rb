require('rspec')
require('definition')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe("#id")do
    xit("returns the id of the definition")do
      test_definition = Definition.new("the word actually means sweet potato in the swahili language")
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe(".find")do
    xit("returns a definition by its id number")do
      test_definition = Definition.new("the word actually means sweet potato in the swahili language")
      test_definition.save()
      test_definition2 = Definition.new("the word actually means sweet potato in the swahili language")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end

  describe("#save") do
    xit("adds a definition to the array of saved definitions") do
      test_definition = Definition.new("the word actually means sweet potato in the swahili language")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    xit("empties out all of the saved definitions") do
      Definition.new("the word actually means sweet potato in the swahili language").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

end
