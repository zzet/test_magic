module TestMagic

  class TestCase

    class Assertion < StandardError; end

    def assert(value)
      raise Assertion unless value == true
    end
  end

end

