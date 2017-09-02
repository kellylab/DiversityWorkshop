### simple math and variables
1+1

x = 2
y <- 1+x

### changing your working directory
setwd("C:/path/to/directory")

### installing and loading packages
install.packages("vegan")
install.packages("ggplot2")
library(vegan)
library(ggplot2)

### using the help function to learn about functions in different packages without google
help(plot)

### learning about a function by using the dataset and code included at the end of a help section
require(stats) # for lowess, rpois, rnorm
data(cars)
plot(cars)
lines(lowess(cars))

plot(sin, -pi, 2*pi) # see ?plot.function

### reading and writing files
table_in <- read.table("seqs_otus.table.txt", header = TRUE, row.names = 1, sep='\t')
table_out <- t(table_in)
write.table(table_out, file = "seqs_otus.transpose.txt", sep = "\t", row.names = TRUE, col.names = TRUE)


### Descriptive statistics

x <- c(0:10, 5:15, 2:10, 14, 15)

x.mean = mean(x)
x.stdev = sd(x)
x.median = median(x)

par(mfcol=c(2,1))
hist(x, breaks=10)
abline(v=x.mean, col= "red")
abline(v=x.median, col= "blue")
boxplot(x, horizontal=T)

