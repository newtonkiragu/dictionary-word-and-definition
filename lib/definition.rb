class Definition
  @@definitions = []
  attr_reader(:id)
  define_method(:initialize) do |attributes|
    @id = @@definitions.length().+(1)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |identification|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(identification.to_i())
        found_definition = definition
      end
    end
    found_definition
  end
end
