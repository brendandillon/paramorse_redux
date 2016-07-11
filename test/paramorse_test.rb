require "simplecov"
SimpleCov.start
require "minitest/pride"
require "minitest/autorun"
require "./lib/paramorse"

class ParaMorseTest < Minitest::Test

  def test_class_paramorse_exists
    assert(ParaMorse)
  end






end
