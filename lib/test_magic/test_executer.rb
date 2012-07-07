module TestMagic
  class TestExecuter

    def execute(options)
      path = options[:path]

      test_files = extract_test_files(path)

      launcher = TestMagic::TestLauncher.new

      test_files.each do |file_path|

        require file_path

        class_name = File.basename(file_path, '.rb').classify.constantize
        class_instance = class_name.new

        methods = class_instance.methods.grep /.*_test$/
        methods.each do |method|
          launcher.run(class_name.new, method)
        end

      end

      launcher.result

    end

    def extract_test_files(path)
      test_files = []

      if File.directory?(path)
        Dir.new(path).entries.each do |file_name|
          next if %w". ..".include? file_name
          test_files += extract_test_files("#{path}/#{file_name}")
        end
      else
        test_files << path if path =~ /.*_test\.rb$/
      end

      test_files
    end

  end
end