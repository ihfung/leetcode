# Is Subsequence

# Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

# A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 

# Example 1:

# Input: s = "abc", t = "ahbgdc"
# Output: true
# Example 2:

# Input: s = "axc", t = "ahbgdc"
# Output: false


def is_subsequence(s, t)
    i, j = 0, 0
    
    while i < s.length && j < t.length
            if (s[i] === t[j])
             i += 1
            end
        j += 1
    end
    i == s.length
end

puts is_subsequence("abc", "ahbgdc") #true
puts is_subsequence("axc", "ahbgdc") #false
puts is_subsequence("abc", "ahbgdc") #true