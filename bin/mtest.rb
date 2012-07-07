require File.expand_path('../../test/test_helper', __FILE__)

test_files = Dir.entries("test")

test_files.each do |file_name|
   next unless file_name =~ /.*_test\.rb$/

   require  Dir.pwd << "/test/" << file_name

   class_name = file_name[0..-4].classify.constantize
   class_instance = class_name.new

   methods = class_instance.methods.grep /.*_test$/
   methods.each do |method|
     class_instance.send(method)
   end
end
