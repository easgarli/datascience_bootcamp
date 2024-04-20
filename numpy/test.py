# write a script testing if the string is a palindrome

# write a script testing if the string is a palindrome

# user enters a string
string = input("Enter a string...")

# 1. Remove non-alphanumeric characters
string = ''.join(filter(str.isalnum, string))

# 2. Check if the string is a palindrome
if string == string[::-1]:
    print("The string is a palindrome!")
else:
    print("The string is not a palindrome!")