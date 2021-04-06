library(readr)
library(ggplot2)
library(magrittr) # to use  %>% notation

#------------------------------------------------
# Reading file
#------------------------------------------------
f <- file.choose(new = FALSE)
data <- read.csv(file = f, header = TRUE)

#------------------------------------------------
# Filter, result with data$V9=="m1Results"
#------------------------------------------------
d <- subset(data, data$resultConcerns=="Results")

#------------------------------------------------
# Factor management (for series)
#------------------------------------------------
d$algorithm = as.factor(d$algoName)

#------------------------------------------------
# Draw the graph
#------------------------------------------------
d %>% ggplot()
d %>%
  ggplot(aes(x = n, y = (makespan/LowBound), color=algorithm, shape=algorithm))+
  #ggplot(aes(x = n, y = (makespan), color=algorithm, shape=algorithm))+
  geom_point()+
  geom_smooth(method=loess, se=FALSE)+
  #geom_smooth(method=lm)+
  # geom_line() + 
  labs(
    title = "Comparaison",
    y = "Makespan normalisé Cmax-optimal"
  )



# keep it for later 
#pdw <- getwd()
#setwd("..//results") 
