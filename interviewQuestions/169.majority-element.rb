#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#
# https://leetcode.com/problems/majority-element/description/
#
# algorithms
# Easy (65.38%)
# Likes:    20104
# Dislikes: 687
# Total Accepted:    3.7M
# Total Submissions: 5.7M
# Testcase Example:  '[3,2,3]'
#
# Given an array nums of size n, return the majority element.
# 
# The majority element is the element that appears more than ⌊n / 2⌋ times. You
# may assume that the majority element always exists in the array.
# 
# 
# Example 1:
# Input: nums = [3,2,3]
# Output: 3
# Example 2:
# Input: nums = [2,2,1,1,1,2,2]
# Output: 2
# 
# 
# Constraints:
# 
# 
# n == nums.length
# 1 <= n <= 5 * 10^4
# -10^9 <= nums[i] <= 10^9
# 
# 
# 
# Follow-up: Could you solve the problem in linear time and in O(1) space?
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}

def majority_element(nums)
    # Boyer-Moore Voting Algorithm
    count = 0
    candidate = nil
    
    nums.each do |num| #we iterate through the array by using each (nums.each) and we assign the value of num to the variable num.
        if count == 0
            candidate = num
        end
        
        count += (num == candidate) ? 1 : -1 #if the number is the same as the candidate, we add 1 to the count, otherwise we subtract 1.
    end
    
    candidate #return the candidate
end

#test
nums = [3,2,3]
puts majority_element(nums)

nums = [2,2,1,1,1,2,2]
puts majority_element(nums)

