class SuccessedTest < TestMagic::TestCase

  def setup
    @a = 5
  end

  def true_test
    sleep 1
    assert true
  end

  def equal_test
    assert_equal 1, 1
  end

  def includes_in_collection_test
    assert_includes ["1", "2", "3"], "1"
  end

  def match_test
    assert_match "_test_", "abra kadabra_test_"
  end

  def assert_setup_test
    assert_equal @a, 5
  end


end
