module TestMagic

  class TestCase
    attr_accessor :assert_count

    class Assertion < StandardError;
      attr_accessor :message
      def initialize(msg)
        message = msg
      end
    end

    def initialize
      @assert_count = 0
    end

    def assert(value)
      @assert_count += 1
      test_assert_failed("Assert failed, except true") unless value == true
    end

    def assert_equal(value1, value2)
      @assert_count += 1
      test_assert_failed("Assert equal failed, has #{value1}, except #{value2}") if value1 != value2
    end


    def name
      self.class.name
    end

    private

      def test_assert_failed(msg)
        raise Assertion.new(msg)
      end

  end

end

