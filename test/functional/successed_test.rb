class SuccessedTest < TestMagic::TestCase

  def true_test
    assert true
  end

  def equal_test
    assert_equal 1, 1
  end

  def includes_in_collection_test
    assert_includes ["1", "2", "3"], "1"
  end
end
