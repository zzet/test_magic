module TestMagic
  class TestOptions

    class << self

      def parse
        options = {
            :path => ARGV.first
        }
        check_options(options)
        options
      end

      def check_options(options)
        options[:path] = check_path(options[:path])
      end

      def check_path(path)
        return Dir.pwd << "/test" if path.nil?
        return Dir.pwd << "/test/" << path unless File.directory?(Dir.pwd << path)
        path
      end

    end

  end
end