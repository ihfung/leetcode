# Longest Subarray of 1's After Deleting One Element

# Given a binary array nums, you should delete one element from it.

# Return the size of the longest non-empty subarray containing only 1's in the resulting array. Return 0 if there is no such subarray.

 

# Example 1:

# Input: nums = [1,1,0,1]
# Output: 3
# Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
# Example 2:

# Input: nums = [0,1,1,1,0,1,1,0,1]
# Output: 5
# Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
# Example 3:

# Input: nums = [1,1,1]
# Output: 2
# Explanation: You must delete one element.

def longest_subarray(nums)
    left = 0
    zero_count = 0
    max_len = 0

    nums.each_with_index do |num, right|
        zero_count += 1 if num == 0

        while zero_count > 1
            zero_count -= 1 if nums[left] == 0
            left += 1
        end

        max_len = [max_len, right - left].max
    end

    # If the entire array contains only 1's, we must delete one element.
    max_len == nums.size ? max_len - 1 : max_len
end


puts longest_subarray([1,1,0,1]) == 3
puts longest_subarray([0,1,1,1,0,1,1,0,1]) == 5