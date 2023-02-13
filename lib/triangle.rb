require 'minitest/autorun'
class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    raise TriangleError, 'Invalid triangle' if a <= 0 || b <= 0 || c <= 0
    raise TriangleError, 'Invalid triangle' if (a + b <= c) || (a + c <= b) || (b + c <= a)
  end

  class TriangleError < StandardError; end
end

triangle = Triangle.new(3, 3, 3)
puts triangle.kind # Output: :equilateral

triangle = Triangle.new(3, 4, 4)
puts triangle.kind # Output: :isosceles

triangle = Triangle.new(3, 4, 5)
puts triangle.kind # Output: :scalene
