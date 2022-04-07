R = int(input("Enter the number of rows and colum:"))
# Initialize matrix1
matrix = []
# For user input
for i in range(R):
    a =[]
    for j in range(R):
    # A for loop for column entries
        if (j == 0):
          a.append(str("X"))
        elif (i == j):
          a.append(str("X"))
        elif (j == (R-1)):
          a.append(str("X"))
        else:
          a.append(str("O"))
    matrix.append(a)
  
# For printing the matrix
for i in range(R):
    for j in range(R):
        print(matrix[i][j], end = " ")
    print()



