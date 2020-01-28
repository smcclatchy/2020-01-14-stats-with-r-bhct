############### Statistics group - 01_28_2020 ################

############## Isabela Gerdes Gyuricza

# 4.10 

# 1. Suppose we are analyzing a set of 4 samples. The first two samples are from 
#a treatment group A and the second two samples are from a treatment group B. 
#This design can be represented with a model matrix like so:

X <- matrix(c(1,1,1,1,0,0,1,1),nrow=4)
rownames(X) <- c("a","a","b","b")
X

# Suppose that the fitted parameters for a linear model give us:
beta <- c(5, 2)

#Use the matrix multiplication operator, %*%, in R to answer the following questions:
#1. What is the fitted value for the A samples? (The fitted Y values.)

#     [,1] [,2]
# a    1    0        5            5*1 + 2*0 
# a    1    0   X          =      5*1 + 2*0 
# b    1    1       2             5*1 + 2*1 
# b    1    1                     5*1 + 2*1 

fitted <- X %*% beta

fittedA <- fitted[1:2,]

#2. What is the fitted value for the B samples? (The fitted Y values.)
fittedB <- fitted[3:4,]

#3. Suppose now we are comparing two treatments B and C to a control group A, each with
#two samples. This design can be represented with a model matrix like so:

X <- matrix(c(1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1),nrow=6)
rownames(X) <- c("a","a","b","b","c","c")
X

#Suppose that the fitted values for the linear model are given by:

beta <- c(10,3,-3)

#What is the fitted value for the B samples?

fitted <- X %*% beta

fittedB <- fitted[3:4,]

#4. What is the fitted value for the C samples?

fittedB <- fitted[5:6,]
