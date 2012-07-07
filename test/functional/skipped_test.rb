class SkippedTest < TestMagic::TestCase

  def skip_test
    skip
    assert false
  end
end