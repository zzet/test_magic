module TestMagic
  class TestLauncher
    attr_accessor :result
    def initialize
      @result = TestResult.new
    end

    def run(instance, method)
      instance.send(method)
      @result.add_success_result(instance, method)
    rescue TestMagic::TestCase::Assertion => e
      @result.add_error_result(instance, method, e)
    rescue Exception => e
      @result.add_failed_result(instance, method, e)
    ensure

    end

  end
end
