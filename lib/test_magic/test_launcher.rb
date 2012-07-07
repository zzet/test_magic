module TestMagic
  class TestLauncher
    def initialize
      @statistics = {:success => 0, :errors => 0}
    end



    def run(instance, method)
      puts "\r\n#---------------------------------------------"
      puts "# We try run #{instance.name}.#{method}"
      puts "#---------------------------------------------\r\n"
      instance.send(method)
      @statistics[:success] += 1
    rescue TestMagic::TestCase::Assertion => e
      @statistics[:errors] += 1
      puts e.message
      puts e.backtrace.inspect
    ensure
      puts "\r\n#---------------------------------------------"
      puts "# end"
      puts "#---------------------------------------------"
    end

    def results
      puts "\r\n\r\n In runned test #{@statistics[:success]} success and #{@statistics[:errors]} errors"
    end
  end
end
