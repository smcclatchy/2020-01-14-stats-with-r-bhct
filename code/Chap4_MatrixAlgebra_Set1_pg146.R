data('father.son', package = 'UsingR')

################################################################################
### Matrix Algebra Ex 1 Pg 146 ####

mean(father.son$sheight)
# The average height of sons is 68.68407 inches


################################################################################
### Matrix Algebra Ex 2 Pg 146 ####

father.son[['fheight_rounded']] <- round(father.son$fheight)
sons71 <- father.son$sheight[father.son$fheight_rounded == 71]

mean(sons71)
# The average height of sons with fathers of 71 inches is 70.54082 inches


################################################################################
### Matrix Algebra Ex 3 Pg 146 ####

# I dont think "C":
#   Y = a + b^(t) + error
# can be written as a linear model.


################################################################################
### Matrix Algebra Ex 4 Pg 147 ####

# I think "D" contributes the most to the error term, followed by "B", but "A"
# and "C" also contribute.




################################################################################
## clear workspace ###########################################

rm(list = ls())
pacman::p_unload('all')
graphics.off()
