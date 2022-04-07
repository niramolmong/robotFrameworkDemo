# This is Python 2
import sys
import time

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
  

for line in sys.stdin:
    print(reverseWordSentence(line))

# while 1:
#      time.sleep(0.01)
#      for line in sys.stdin.readlines():
#          print(reverseWordSentence(line))
#          sys.stdout.flush()

# while 1:
#         line = sys.stdin.readline()
#         print(reverseWordSentence(line))
#         time.sleep(1)

# for line in sys.stdin.readlines():
#     pass # do something useful
#     print(reverseWordSentence(line))

