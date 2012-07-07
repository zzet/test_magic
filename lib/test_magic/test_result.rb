module TestMagic
  class TestResult

    def initialize
    end

    def add_success_result(inst, method)
      stat[inst.name] << {
        :inst => inst,
        :test => method,
      }
    end

    def add_error_result(inst, method, err)
      stat[inst.name] << {
        :inst => inst,
        :test => method,
        :error => err
      }
    end

    def add_failed_result(inst, method, err)
      stat[inst.name] << {
        :inst => inst,
        :test => method,
        :error => err
      }
    end


    def stat
      @stat ||= Hash.new {|h,k| h[k]=[]}
    end

    def print

      failed_tests = 0
      success_tests = 0
      assert_count = 0

      stat.each do |k, s|
        s.each do |t|
          failed_tests += 1 if t[:error]
          success_tests += 1 unless t[:error]
          assert_count += t[:inst].assert_count
        end
      end

      puts "Results: In Total #{failed_tests + success_tests}, Failed: #{failed_tests}, Asserts count : #{assert_count}"

    end

  end

end
