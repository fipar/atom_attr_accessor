require 'test/unit'
require 'atom_attr_accessor'

class BasicTest < Test::Unit::TestCase
  class ThreadSafe 
    atom_attr_accessor :id, :name
  end

  def test_atom_attr_accessor_inc_int
    t = ThreadSafe.new
    t.id = 1
    Thread.new {t.id += 1}
    Thread.new {t.id += 1}
    Thread.new {t.id += 1}
    sleep 1 
    assert_equal 4, t.id
  end

  def test_atom_attr_accessor_dec_int
    t = ThreadSafe.new
    t.id = 10
    10.times do
      Thread.new {t.id -= 1}
    end
    sleep 1
    assert_equal 0, t.id
  end

  def test_atom_attr_accessor_string
    t = ThreadSafe.new
    t.name = "test"
    Thread.new { t.name = t.name.reverse }
    Thread.new { t.name = t.name.reverse}
    sleep 1
    assert_equal "test", t.name
  end

end
