module TestMagic
  class TestResult

    def initialize
      $stdout.sync = true
    end

    def add_success_result(inst, method)
      print " .".green
      stat[inst.name] << {
        :inst => inst,
        :test => method,
        :type => "PASS"
      }
    end

    def add_error_result(inst, method, err)
      print " E".yellow
      stat[inst.name] << {
        :inst => inst,
        :test => method,
        :error => err,
        :type => "ERROR"
      }
    end

    def add_failed_result(inst, method, err)
      print " F".red
      stat[inst.name] << {
        :inst => inst,
        :test => method,
        :error => err,
        :type => "FAILED"
      }
    end


    def stat
      @stat ||= Hash.new {|h,k| h[k]=[]}
    end

    def output

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

      puts "\r\n\r\nResults: In Total #{failed_tests + success_tests}, Failed: #{failed_tests}, Asserts count : #{assert_count}"

    end

    def output_test_info(test)
      if t[:error]

      else

      end
    end
  end

end
