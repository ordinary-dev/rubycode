# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  max_val = nums.max

  nums[0...-1].each_with_index do |a, i|
    # Skip this number if any sum will be less than target
    next if a + max_val < target

    nums[i + 1..].each_with_index do |b, j|
      return [i, j + i + 1] if a + b == target
    end
  end
end
