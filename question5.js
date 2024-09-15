/*
Reverse Vowels of a String

Given a string s, reverse only all the vowels in the string and return it.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 
Example 1:

Input: s = "IceCreAm"

Output: "AceCreIm"

Explanation:

The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".

Example 2:

Input: s = "leetcode"

Output: "leotcede"

*/

let reverseVowels = function(s) {
  let temp = [];
  for (let char of s) {
    if (char === 'a' || char === 'A') {
      temp.push(char);
    } else if (char === 'e' || char === 'E') {
      temp.push(char);
    } else if (char === 'i' || char === 'I') {
      temp.push(char);
    } else if (char === 'o' || char === 'O') {
      temp.push(char);
    } else if (char === 'u' || char === 'U') {
      temp.push(char);
    }
  }

  const reverse = temp.reverse();
  let index = 0;
  const newString = s.split('');
    
  for (let i = 0; i < newString.length; i++) {

    if (newString[i] === 'a' || newString[i] === 'A') {
      newString[i] = reverse[index];
      index++;
    } else if (newString[i] === 'e' || newString[i] === 'E') {
      newString[i] = reverse[index];
      index++;
    } else if (newString[i] === 'i' || newString[i] === 'I') {
      newString[i] = reverse[index];
      index++;
    } else if (newString[i] === 'o' || newString[i] === 'O') {
      newString[i] = reverse[index];
      index++;
    } else if (newString[i] === 'u' || newString[i] === 'U') {
      newString[i] = reverse[index];
      index++;
    }

  }
  let result = newString.join('');
  return result;
};

console.log(reverseVowels("IceCreAm")); // "AceCreIm"
console.log(reverseVowels("leetcode")); // "leotcede"
console.log(reverseVowels("hello")); // "holle"