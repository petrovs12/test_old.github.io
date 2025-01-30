---
id: 3t52cgw7uid4uo51lcznjwm
title: Almost Palindrome
desc: ""
updated: 1733569331878
created: 1733568245947
---


# Description
This question is on leetcode: https://leetcode.com/problems/valid-palindrome-ii/



Given a string S consisting of lowercase English characters, determine if you can make it a palindrome by removing at most 1 character.


 -- removing at most one character 

 use r poi'nters to walk the string, use a helper, helper has arumeng , denoting if a difference has been found already.
 test both options independently,
 but since we're allowed at most one mistmatchh,
 its stil O(n), - O(3n').

 ```
 bool isPalindrome(string s, int left, int right) {
  if (s.length() < 1 || left == right) {
    return true;
  }
  while(left < right) { 
    if (s[left] != s[right]) {
      return false;
    }
    ++left; --right;
  }
  return true;
}

bool isAlmostPalindrome(string s) {
  if (s.length() <= 2) {
    return true;
  }
  int left = 0, right = s.length() - 1;
  while(left < right) { 
    if (s[left] != s[right]) {
      return isPalindrome(s, left+1, right) || isPalindrome(s, left, right-1);
    }
    ++left; --right;
  }
  return true;
}
```  