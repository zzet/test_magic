class FailedTest < TestMagic::TestCase
  def false_test
    assert false
  end

  def equal_test
    assert_equal 1, 2
  end

  def equal_type_test
    assert_equal 1, "1"
  end

  def match_test
    assert_match "1", "22222222"
  end
  def includes_test
    assert_includes [1,2,3], 4
  end

end
