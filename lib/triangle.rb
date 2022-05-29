require 'pry'

class Triangle
  attr_accessor :side_one, :side_two, :side_three
  # write code here
  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    # binding.pry
    greater_than_0_error?
    triangle_inequality_error?
    if side_one == side_two && side_two == side_three
      :equilateral
    elsif side_one == side_two || side_two == side_three || side_one == side_three
      :isosceles
    else side_one != side_two && side_two != side_three
      :scalene
    end
  end

  # raise TriangleError
  def greater_than_0_error?
    # binding.pry
    if self.side_one <= 0 || self.side_two <= 0 || self.side_three <= 0
      raise TriangleError, "Testing error message"
      #how you add a message if you want to with the error
    end
  end

  def triangle_inequality_error?
     if side_one + side_two <= side_three || side_two + side_three <= side_one || side_three + side_one <= side_two
      raise TriangleError
     end
  end

  class TriangleError < StandardError
  end

end

# new_triangle = Triangle.new(2, 2, 3)
# puts new_triangle.check_errors
