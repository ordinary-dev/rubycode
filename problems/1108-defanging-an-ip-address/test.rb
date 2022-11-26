require_relative 'main'
require 'test/unit'

class TestDefangIpAddr < Test::Unit::TestCase
  def test_simple
    assert_equal('1[.]1[.]1[.]1', defang_i_paddr('1.1.1.1'))
    assert_equal('255[.]100[.]50[.]0', defang_i_paddr('255.100.50.0'))
  end
end
