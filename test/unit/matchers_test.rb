# frozen_string_literal: true

require "test_helper"

class MatchersTest < Minitest::Test
  test "appends item" do
    matchers = Browser::Matchers.new

    matchers.append(1)
    matchers.append(2)

    assert_equal [1, 2], matchers.to_a
  end

  test "prepends item" do
    matchers = Browser::Matchers.new

    matchers.append(1)
    matchers.prepend(2)

    assert_equal [2, 1], matchers.to_a
  end

  test "inserts before item" do
    matchers = Browser::Matchers.new

    matchers.append(1)
    matchers.append(2)
    matchers.insert_before(2, 3)

    assert_equal [1, 3, 2], matchers.to_a
  end

  test "inserts after item" do
    matchers = Browser::Matchers.new

    matchers.append(1)
    matchers.append(2)
    matchers.insert_after(1, 3)

    assert_equal [1, 3, 2], matchers.to_a
  end

  test "is enumerable" do
    assert Browser::Matchers.ancestors.include?(Enumerable)
  end

  test "iterates each item" do
    result = []
    matchers = Browser::Matchers.new

    matchers.append(1)
    matchers.append(2)
    matchers.each {|matcher| result << matcher }

    assert_equal matchers.to_a, result
  end

  test "initializes matchers" do
    matchers = Browser::Matchers.new([1, 2, 3])
    assert_equal [1, 2, 3], matchers.to_a
  end
end
