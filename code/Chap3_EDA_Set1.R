################################################################################
### EDA Ex 1 Pg 125 ####

# 6 people


################################################################################
### EDA Ex 2 Pg 125 ####

# Spray "C" appears to be the most effective at reducing insect numbers

GROUPED_SPRAYS <- split(
  InsectSprays$count, 
  InsectSprays$spray
)
boxplot(
  GROUPED_SPRAYS,
  xlab = 'Spray',
  ylab = 'Count',
  cex = 0
)
stripchart(
  GROUPED_SPRAYS, 
  vertical = TRUE, 
  method = 'jitter', 
  add = TRUE
)

GROUPED_SPRAYS <- split(
  log(InsectSprays$count + 1), 
  InsectSprays$spray
)
boxplot(
  GROUPED_SPRAYS,
  xlab = 'Spray',
  ylab = 'ln[Count]',
  cex = 0
)
stripchart(
  GROUPED_SPRAYS, 
  vertical = TRUE, 
  method = 'jitter', 
  add = TRUE
)


################################################################################
### EDA Ex 3 Pg 125 ####

# All the columns except 4 and 9 are normally distributed with means around 0 
# and standard deviations close to 1. Column 4 is right, or positively, skewed.

load(url('http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData'))

boxplot(dat)

summary(dat, digits = 1)
# V1              V2              V3               V4              V5               V6              V7              V8               V9       
# Min.   :-3.01   Min.   :-3.25   Min.   :-3.540   Min.   : 0.09   Min.   :-3.671   Min.   :-3.23   Min.   :-3.06   Min.   :-3.147   Min.   :-22.6  
# 1st Qu.:-0.70   1st Qu.:-0.69   1st Qu.:-0.634   1st Qu.: 1.92   1st Qu.:-0.674   1st Qu.:-0.66   1st Qu.:-0.72   1st Qu.:-0.674   1st Qu.: -5.4  
# Median :-0.04   Median :-0.03   Median :-0.005   Median : 3.47   Median :-0.004   Median :-0.04   Median :-0.02   Median : 0.011   Median : -3.3  
# Mean   :-0.01   Mean   :-0.02   Mean   : 0.015   Mean   : 4.00   Mean   :-0.020   Mean   :-0.01   Mean   :-0.02   Mean   :-0.004   Mean   : -4.0  
# 3rd Qu.: 0.69   3rd Qu.: 0.74   3rd Qu.: 0.715   3rd Qu.: 5.49   3rd Qu.: 0.623   3rd Qu.: 0.62   3rd Qu.: 0.65   3rd Qu.: 0.673   3rd Qu.: -1.9  
# Max.   : 3.81   Max.   : 3.64   Max.   : 2.862   Max.   :18.09   Max.   : 2.737   Max.   : 2.86   Max.   : 3.62   Max.   : 2.955   Max.   : -0.1 

boxplot(log(dat + 25))
boxplot(exp(dat))

par(mfrow = c(3,3))
for(i in 1:ncol(dat)){
  hist(
    dat[,i],
    main = paste0('Column ', i)
  )
}
par(mfrow = c(1,1))

par(mfrow = c(3,3))
for(i in 1:ncol(dat)){
  qqnorm(
    dat[,i],
    main = paste0('Column ', i)
  )
  qqline(dat[,i])
}
par(mfrow = c(1,1))


pairs(dat)

round(apply(dat, 2, mean), 2)
# [1] -0.01 -0.02  0.02  4.00 -0.02 -0.01 -0.02  0.00 -4.01
round(apply(dat, 2, sd), 2)
# [1] 1.03 1.04 1.03 2.69 0.99 0.98 1.04 1.00 2.93


################################################################################
### EDA Ex 4 Pg 125 ####

# Column 9 is left, or negatively, skewed.

hist(dat[,9])


################################################################################
### EDA Ex 5 Pg 125 ####

# The answer is C: Male and females have similar right-skewed distributions
# with the former shifted 20 minutes to the left.
# 
# The shape of the distribution of times is the similar for males and females,
# but the male times are slighlty shifted to the left. In other words, the 
# average time for males appears to be slighlty shorter.

library(dplyr)
data(nym.2002, package = 'UsingR')

head(nym.2002)

GENDER_GROUPED_TIMES <- split(
  nym.2002$time,
  nym.2002$gender
) 
boxplot(
  GENDER_GROUPED_TIMES,
  xlab = 'Gender',
  ylab = 'Time'
)

par(mfrow = c(2,1))
hist(
  GENDER_GROUPED_TIMES$Female,
  xlim = c(0,600),
  main = 'Female Times',
  breaks = 25
)
hist(
  GENDER_GROUPED_TIMES$Male,
  xlim = c(0,600),
  main = 'Male Times',
  breaks = 25
)
par(mfrow = c(1,1))

lapply(GENDER_GROUPED_TIMES, summary, digits = 2)
# $Female
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 180     250     280     280     310     570 
# 
# $Male
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 150     230     260     260     290     510 
lapply(GENDER_GROUPED_TIMES, sd)
# $Female
# [1] 51.42358
# 
# $Male
# [1] 52.9849
lapply(GENDER_GROUPED_TIMES, mad)
# $Female
# [1] 41.94523
# 
# $Male
# [1] 46.46715

GENDER_GROUPED_TIMES <- split(
  log(nym.2002$time),
  nym.2002$gender
) 
boxplot(
  GENDER_GROUPED_TIMES,
  xlab = 'Gender',
  ylab = 'ln[Time]'
)

par(mfrow = c(2,1))
hist(
  GENDER_GROUPED_TIMES$Female,
  xlim = c(4,7),
  main = 'Female log-Times',
  breaks = 25
)
hist(
  GENDER_GROUPED_TIMES$Male,
  xlim = c(4,7),
  main = 'Male log-Times',
  breaks = 25
)
par(mfrow = c(1,1))


################################################################################
### EDA Ex 6 Pg 126 ####

# The Pearson correlation between age and time for males is 0.243

males <- nym.2002 %>% 
  filter(gender == 'Male')
females <- nym.2002 %>% 
  filter(gender == 'Female')

round(cor(males$time, males$age, method = 'pearson'), 3)
# [1] 0.243


################################################################################
### EDA Ex 7 Pg 126 ####

# The Pearson correlation between age and time for females is 0.244

round(cor(females$time, females$age, method = 'pearson'), 3)
# [1] 0.244


################################################################################
### EDA Ex 8 Pg 126 ####

# A, but it's not a perfect answer

males <- males %>% 
  mutate(
    StratAge = ceiling(age/5) * 5,
    StratAge = factor(as.character(StratAge), levels = seq(5,85,5))
  )
females <- females %>% 
  mutate(
    StratAge = ceiling(age/5) * 5,
    StratAge = factor(as.character(StratAge), levels = seq(5,85,5))
  )

par(mfrow = c(2,1))
boxplot(
  split(males$time, males$StratAge),
  main = 'Male Times'
)
boxplot(
  split(females$time, females$StratAge),
  main = 'Female Times'
)
par(mfrow = c(1,1))

par(mfrow = c(2,1))
boxplot(
  split(log(males$time), males$StratAge),
  main = 'Male log-Times'
)
boxplot(
  split(log(females$time), females$StratAge),
  main = 'Female log-Times'
)
par(mfrow = c(1,1))

par(mfrow = c(2,1))
plot(
  males$age, males$time,
  main = 'Male Times'
)
plot(
  females$age, females$time,
  main = 'Female Times'
)
par(mfrow = c(1,1))


################################################################################
### EDA Ex 9 Pg 126 ####

# A and/or D


################################################################################
### EDA Ex 10 Pg 126 ####

# A and/or D




################################################################################
## clear workspace ###########################################

rm(list = ls())
pacman::p_unload('all')
