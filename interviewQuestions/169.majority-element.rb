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
    
    count = 0
    candidate = nil
    #we iterate through the array by using each (nums.each) and we assign the value of num to the variable num.
    nums.each do |num|
        if count == 0
            candidate = num
        end
        #if the number is the same as the candidate, we add 1 to the count, otherwise we subtract 1.
        count += (num == candidate) ? 1 : -1 
    end
    
    candidate #return the candidate
end

#test
nums = [3,2,3]
puts majority_element(nums)

nums = [2,2,1,1,1,2,2]
puts majority_element(nums)


# How it works:
# The algorithm maintains a count and a candidate
# When count reaches 0, we pick a new candidate
# If we see the same number as candidate, we increment count
# If we see a different number, we decrement count
# The majority element will always be the final candidate because it appears more than n/2 times
# This works because:
# If an element is truly the majority (appears > n/2 times), it will always win the "voting" process
# All other elements combined can't outnumber the majority element, so it will survive as the final candidate
# The previous solution worked but was inefficient because it was counting occurrences for each number, leading to O(n²) time complexity. This new solution is both more elegant and more efficient.

# The code uses something called the Boyer-Moore Voting Algorithm, but let's understand it with a real-world analogy:
# Imagine you're in a room full of people voting for either Team Red or Team Blue:
# Every time you see someone from Team Red, they get +1 point
# Every time you see someone from Team Blue, they get -1 point
# If the points reach 0, you pick the next person you see as the new team to track

# Why this works:
# Since we know there's always a majority element (appears more than n/2 times)
# It's impossible for other numbers to "outvote" the majority number
# Even if we switch candidates a few times, the majority element will always win in the end
# It's like having a room where you know Team Red has more people than all other teams combined - no matter how you count, Team Red will always win the final count!
# The code is just keeping track of:cl
# 1. Who's currently winning (candidate)
# By how many votes (count)