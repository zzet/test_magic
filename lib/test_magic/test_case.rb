module TestMagic

  class TestCase
    attr_accessor :assert_count

    class Assertion < StandardError;
      attr_accessor :message
      def initialize(msg)
        @message = msg
      end
    end

    def initialize
      @assert_count = 0
    end

    def assert(value, msg = nil)
      msg ||= "Assert failed, except true"
      @assert_count += 1
      test_assert_failed(msg) unless value == true
    end

    def assert_equal(value1, value2, msg = nil)
      msg ||= "Assert equal failed, has #{value1}:#{value1.class.name}, except #{value2}:#{value2.class.name}"
      @assert_count += 1
      assert(value1 == value2, msg)
    end

    def assert_includes(collection, obj, msg = nil)
      msg ||= "Assert includes failed, #{collection} has'n #{obj}"
      @assert_count += 1
      assert collection.include?(obj), msg
    end

    def assert_match(exp, act, msg = nil)
      msg = "Expected #{exp} to match #{act}"
      exp = Regexp.new Regexp.escape exp
      assert exp =~ act, msg
    end


    def name
      self.class.name
    end

    def setup; end
    def teardown; end

    private

      def test_assert_failed(msg)
        raise Assertion.new(msg)
      end

  end

end

