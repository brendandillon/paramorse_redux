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

def test_queue_count_one_word
  q = ParaMorse::Queue.new
  q.push("something")
  assert_equal 1, q.queue.count
end

def test_queue_pops_a_word_out
  q = ParaMorse::Queue.new
  q.push("something")
  assert_equal "something", q.queue.join
  q.pop
  assert_equal [], q.queue
end

def test_peek_one_letter
  q = ParaMorse::Queue.new
  q.push("something")
  assert_equal "something", q.queue.join
  q.pop
  assert_equal [], q.queue
end


end
