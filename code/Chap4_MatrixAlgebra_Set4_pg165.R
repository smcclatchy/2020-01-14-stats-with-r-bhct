################################################################################
### Matrix Algebra Ex 1 Pg 165 ####

X <- matrix(
  c(1,1,1,1,0,0,1,1),
  nrow = 4
)
rownames(X) <- c('a', 'a', 'b', 'b')
X
#   [,1] [,2]
# a    1    0
# a    1    0
# b    1    1
# b    1    1

beta <- c(5,2)

Y_hat <- X%*%beta
#   [,1]
# a    5
# a    5
# b    7
# b    7

# The fitted value for the A samples is 5

################################################################################
### Matrix Algebra Ex 2 Pg 165 ####

# The fitted value for the B sample is 7


################################################################################
### Matrix Algebra Ex 3 Pg 165 ####

X <- matrix(
  c(1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1),
  nrow = 6
)
rownames(X) <- rep(c('a', 'b', 'c'), each = 2)
X
#   [,1] [,2] [,3]
# a    1    0    0
# a    1    0    0
# b    1    1    0
# b    1    1    0
# c    1    0    1
# c    1    0    1

beta <- c(10, 3, -3)

Y_hat <- X%*%beta
#   [,1]
# a   10
# a   10
# b   13
# b   13
# c    7
# c    7

# The fitted value for the B sample is 13

################################################################################
### Matrix Algebra Ex 4 Pg 165 ####

# The fitted value for the C sample is 7





################################################################################
## clear workspace ###########################################

rm(list = ls())
pacman::p_unload('all')
graphics.off()
