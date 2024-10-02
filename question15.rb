# Maximum Number of Vowels in a Substring of Given Length

# Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.

# Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

 

# Example 1:

# Input: s = "abciiidef", k = 3
# Output: 3
# Explanation: The substring "iii" contains 3 vowel letters.
# Example 2:

# Input: s = "aeiou", k = 2
# Output: 2
# Explanation: Any substring of length 2 contains 2 vowels.
# Example 3:

# Input: s = "leetcode", k = 3
# Output: 2
# Explanation: "lee", "eet" and "ode" contain 2 vowels.

def max_vowels(s, k)
    vowels = ['a', 'e', 'i', 'o', 'u']
    max_count = 0
    current_count = 0
    
    # Initial count of vowels in the first window of size k
    (0...k).each do |i|
        current_count += 1 if vowels.include?(s[i])
    end
    
    max_count = current_count
    
    # Slide the window across the string
    (k...s.length).each do |i|
        # Remove the influence of the char going out of the window
        current_count -= 1 if vowels.include?(s[i - k])
        # Add the influence of the new char coming into the window
        current_count += 1 if vowels.include?(s[i])
        
        max_count = [max_count, current_count].max
    end
    
    max_count
end




