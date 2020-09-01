require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test

  def setup

    @nbc = Network.new("NBC")
  end

  def test_it_exists

    assert_instance_of Network, @nbc
  end

  def test_it_has_attributes

    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows 
  end

end
