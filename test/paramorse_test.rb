require "minitest/pride"
require "minitest/autorun"
require 'simplecov'
SimpleCov.start
require "./lib/paramorse"

class ParaMorseTest < Minitest::Test


def test_queue_pushes_a_word_in
  q = ParaMorse::Queue.new
  q.push("something")
  assert_equal "something", q.queue.join
end


end
