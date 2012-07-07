class LongTest < TestMagic::TestCase

  def long1_test
    sleep 2
    assert true
  end

  def long2_test
    sleep 2
    assert false
  end

  def long3_test
    sleep 2
    assert true
  end

  def long4_test
    sleep 2
    assert false
  end
end