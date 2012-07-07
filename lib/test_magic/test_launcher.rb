module TestMagic
  class TestLauncher
    attr_accessor :result
    def initialize
      @result = TestResult.new
    end

    def run(instance, method)
      instance.setup

      time_start = Time.now.to_f
      instance.send(method)
      time_end = Time.now.to_f
      time_diff = (time_end - time_start).round(4)

      @result.add_success_result(instance, method, time_diff)
    rescue TestMagic::TestCase::Assertion => e
      @result.add_failed_result(instance, method, e)
    rescue TestMagic::TestCase::Skipped => e
      @result.add_skipped_result(instance, method, e)
    rescue Exception => e
      @result.add_error_result(instance, method, e)
    ensure
      instance.teardown
    end

  end
end
