library(tidyverse)
library(gganimate)

#Setting of the principal parameters
NUMBER = 50
SPIN = 0.5
TMAX = 500

#Each particule has a uniform probabilaty that their spin equals 1/2 or -1/2
#the matrix Status register all the microstates of the N particules at each row
Status = matrix(0, nrow=TMAX, ncol=NUMBER)

#Initially, all particules are in a + state
Status[1,] = rep(SPIN,NUMBER)

#Evaluate each step of the system
for(i in 2:TMAX){
  Status[i,] = (2*rbinom(NUMBER,1,0.5)-1)*SPIN
}

totalSpin = apply(Status,1,sum)
Step = 1:TMAX

#Convert into a dataframe
df = data.frame(Step,totalSpin)

#using ggplot2

p <- ggplot(df, aes(x = Step, y = totalSpin, frame = Step)) + geom_point()

gganimate(p)