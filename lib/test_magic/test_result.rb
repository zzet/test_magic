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
        puts "\r\n\r\nFile Name: #{k}\r\n"
        s.each do |t|
          failed_tests += 1 if t[:error]
          success_tests += 1 unless t[:error]
          assert_count += t[:inst].assert_count
          puts "\r\n"
          output_test_info(t)
        end
      end

      puts "\r\n\r\n---"
      puts "\r\nFAILED TESTS".red

      stat.each do |k, s|
        s.each do |test|
          if test[:error]
            case test[:type]
              when "FAILED"
                puts "  " << test[:inst].name.red << ": test " << test[:test].to_s.red << "\r\n    " << test[:error].message.to_s
                puts "    " <<test[:error].backtrace.join("\r\n    ") << "\r\n\r\n"
              else

              end
            end
          end
      end

      puts "\r\n\r\nERRORS TESTS".yellow

      stat.each do |k, s|
        s.each do |test|
          if test[:error]
            case test[:type]
              when "ERROR"
                puts "  " << test[:inst].name.yellow << ": test " << test[:test].to_s.yellow << "\r\n    " << test[:error].message.to_s
                puts "    " << test[:error].backtrace.join("\r\n    ") << "\r\n\r\n"
              else

              end
            end
          end
      end

      puts "\r\n\r\nResults: In Total #{failed_tests + success_tests}, Failed: #{failed_tests}, Asserts count : #{assert_count}"

    end

    def output_test_info(test)
      case test[:type]
        when "PASS"
          print "  " << test[:type].green << ": test " << test[:test].to_s.green
        when "ERROR"
          print "  " << test[:type].yellow << ": test " << test[:test].to_s.yellow
        when "FAILED"
          print "  " << test[:type].red << ": test " << test[:test].to_s.yellow
        else
        end
    end
  end

end
