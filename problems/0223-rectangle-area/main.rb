def find_intersection(a, b)
  a,b = b,a if a.min > b.min
  
  return [a.max, b.max].min - b.min if a.max > b.min

  0
end

# @param {Integer} ax1
# @param {Integer} ay1
# @param {Integer} ax2
# @param {Integer} ay2
# @param {Integer} bx1
# @param {Integer} by1
# @param {Integer} bx2
# @param {Integer} by2
# @return {Integer}
def compute_area(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
  # Area of the first rectangle
  a = (ax2 - ax1) * (ay2 - ay1)

  # Area of the second rectangle
  b = (bx2 - bx1) * (by2 - by1)

  # Find intersection
  x_intersection = find_intersection(ax1..ax2, bx1..bx2)
  y_intersection = find_intersection(ay1..ay2, by1..by2)

  a + b - x_intersection * y_intersection
end
