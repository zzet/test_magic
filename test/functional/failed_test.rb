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

end
