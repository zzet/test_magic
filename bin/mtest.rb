#! /usr/bin/env ruby

require File.expand_path('../../test/test_helper', __FILE__)

options = TestMagic::TestOptions.parse
executer = TestMagic::TestExecuter.new
result = executer.execute options

result.print
