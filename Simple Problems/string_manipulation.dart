void main() {
  // 1. String Reversal
  String original = "Dart Programming";
  String reversed = reverseString(original);
  print('Original: $original');
  print('Reversed: $reversed');

  // 2. Palindrome Check
  String word = "level";
  bool isPal = isPalindrome(word);
  print('\nIs "$word" a palindrome? $isPal');

  // 3. Vowel Counting
  String text = "Hello World";
  int vowels = countVowels(text);
  print('\nNumber of vowels in "$text": $vowels');
}

String reverseString(String s) {
  return s.split('').reversed.join('');
}

bool isPalindrome(String s) {
  String reversed = reverseString(s);
  return s.toLowerCase() == reversed.toLowerCase();
}

int countVowels(String s) {
  int count = 0;
  var vowels = ['a', 'e', 'i', 'o', 'u'];
  for (var char in s.toLowerCase().split('')) {
    if (vowels.contains(char)) {
      count++;
    }
  }
  return count;
}
