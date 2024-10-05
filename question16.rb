# Max Consecutive Ones III

# Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.


# Example 1:

# Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
# Output: 6
# Explanation: [1,1,1,0,0,1,1,1,1,1,1]
# Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
# Example 2:

# Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
# Output: 10
# Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
# Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.


def longest_ones(nums, k)
  left = 0
  max_length = 0
  zeros_count = 0

  # Sliding window
  nums.each_with_index do |num, right|
    # If the current number is 0, increase the count of zeros in the window
    zeros_count += 1 if num == 0

    # If the number of zeros exceeds k, shrink the window from the left
    while zeros_count > k
      zeros_count -= 1 if nums[left] == 0
      left += 1
    end

    # Calculate the size of the current window and update max_length
    max_length = [max_length, right - left + 1].max
  end

  max_length
end


puts longest_ones([1,1,1,0,0,0,1,1,1,1,0], 2) == 6
puts longest_ones([1,1,1,0,0,0,1,1,1,1,0], 0) == 3