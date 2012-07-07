module TestMagic

  class TestCase

    class Assertion < StandardError;
      def message
        "tets message"
      end
    end

    def assert(value)
      raise Assertion unless value == true
    end

    def name
      self.class.name
    end
  end

end

