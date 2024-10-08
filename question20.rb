# Find the Difference of Two Arrays

# Given two 0-indexed integer arrays nums1 and nums2, return a list answer of size 2 where:

# answer[0] is a list of all distinct integers in nums1 which are not present in nums2.
# answer[1] is a list of all distinct integers in nums2 which are not present in nums1.
# Note that the integers in the lists may be returned in any order.

 

# Example 1:

# Input: nums1 = [1,2,3], nums2 = [2,4,6]
# Output: [[1,3],[4,6]]
# Explanation:
# For nums1, nums1[1] = 2 is present at index 0 of nums2, whereas nums1[0] = 1 and nums1[2] = 3 are not present in nums2. Therefore, answer[0] = [1,3].
# For nums2, nums2[0] = 2 is present at index 1 of nums1, whereas nums2[1] = 4 and nums2[2] = 6 are not present in nums2. Therefore, answer[1] = [4,6].
# Example 2:

# Input: nums1 = [1,2,3,3], nums2 = [1,1,2,2]
# Output: [[3],[]]
# Explanation:
# For nums1, nums1[2] and nums1[3] are not present in nums2. Since nums1[2] == nums1[3], their value is only included once and answer[0] = [3].
# Every integer in nums2 is present in nums1. Therefore, answer[1] = [].

def find_difference(nums1, nums2)
    # Convert both arrays to sets to eliminate duplicates and enable set operations
    set1 = nums1.to_set #to_set is a method that converts an array to a set and set is a collection of unordered elements with no duplicates
    set2 = nums2.to_set

    # Find elements in nums1 not in nums2 (set difference)
    diff1 = set1 - set2

    # Find elements in nums2 not in nums1 (set difference)
    diff2 = set2 - set1

    # Convert sets back to arrays and return the result
    [diff1.to_a, diff2.to_a] #to_a is a method that converts a set to an array

end