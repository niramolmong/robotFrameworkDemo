# This is Python 2
import sys

line = int(sys.stdin.readline())
# print line

line2 = sys.stdin.readline()
# print line2

matrix = []

for i in range(line):
        print(line2)






# This is Python 2
import sys


Sentence = sys.stdin.read()


def reverseWordSentence(line):
  
    # Splitting the Sentence into list of words.
    words = line.split(" ")
      
    # Reversing each word and creating
    # a new list of words
    # List Comprehension Technique
    newWords = [word[::-1] for word in words]
      
    # Joining the new list of words
    # to for a new Sentence
    newSentence = " ".join(newWords)
  
    return newSentence
  

print(reverseWordSentence(Sentence))





# This is Python 2
import sys


Sentence1 = sys.stdin.readline()
Sentence2 = sys.stdin.readline()


def reverseWordSentence(line):
  
    # Splitting the Sentence into list of words.
    
    words = line.split()
      
    # Reversing each word and creating
    # a new list of words
    # List Comprehension Technique
    newWords = [word[::-1] for word in words]
      
    # Joining the new list of words
    # to for a new Sentence
    newSentence = " ".join(newWords)
  
    return newSentence
  

print(reverseWordSentence(Sentence1))
print(reverseWordSentence(Sentence2))

