# class Triangle
#   # triangle code
#   attr_reader :s1, :s2, :s3
  
#   def initialize(s1, s2, s3)
#     @s1 = s1
#     @s2 = s2
#     @s3 = s3
#   end
#   def kind

#     if (s1 == s2) && (s2 == s3)
#        :equilateral
#     elsif (s1 == s2) || (s2 == s3) || (s1 == s3)
#         :isosceles
#     else
#       :scalene
#    end
#   end
  
#   def sides_greater_than_zero?
#     [s1, s2, s3].all?(&:positive?)
#   end

#   def valid_triangle_inequality?
#     s1 + s2 > s2 && s1 + s3 > s2 && s2 + s3 > s1
#   end
#   def validate_triangle
#     raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
#   end
#   class TriangleError < StandardError
#     # triangle error code
#   end
# end


class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end