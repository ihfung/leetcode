# Maximum Average Subarray I

# You are given an integer array nums consisting of n elements, and an integer k.

# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

 

# Example 1:

# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
# Example 2:

# Input: nums = [5], k = 1
# Output: 5.00000


def find_max_average(nums, k)
  # Calculate the sum of the first 'k' elements
  max_sum = sum = nums[0...k].sum
  
  # Use sliding window to compute the sum of subarrays of length 'k'
  (k...nums.length).each do |i|
    sum += nums[i] - nums[i - k]  # slide the window
    max_sum = [max_sum, sum].max   # keep track of the maximum sum
  end
  
  # Return the maximum average
  max_sum.to_f / k
end


puts find_max_average([1,12,-5,-6,50,3], 4) == 12.75
puts find_max_average([5], 1) == 5.0