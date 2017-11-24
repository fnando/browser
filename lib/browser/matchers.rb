# frozen_string_literal: true

module Browser
  class Matchers
    include Enumerable

    def initialize(matchers = [])
      @matchers = matchers
    end

    def each(&block)
      @matchers.each(&block)
    end

    def append(matcher)
      @matchers << matcher
    end

    def prepend(matcher)
      @matchers.unshift(matcher)
    end

    def insert_before(target, matcher)
      index = @matchers.index(target)
      @matchers.insert(index, matcher)
    end

    def insert_after(target, matcher)
      index = @matchers.index(target)
      @matchers.insert(index + 1, matcher)
    end

    def to_ary
      @matchers
    end
    alias_method :to_a, :to_ary
  end
end
