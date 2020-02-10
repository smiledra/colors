library(munsell)
library(ggplot2)

setwd("~/Downloads")

rm(list=ls())
theme_set(theme_classic())

colors = read.csv('colors.csv')

for (c in colors$colors){

  # Convert MNSL to hex
  #h = mnsl("5R 9/2")
  h = mnsl(c, fix=TRUE)
  # create empty data frame just because
  data=data.frame()
  
  print(c)
  print(h)
  p = c(h)
  # plot ggplot directly so I can use ggsave
  ggplot(data = data) + 
    geom_rect(aes(xmin=0, xmax=100, ymin=0, ymax=100), fill=h, color=h) + 
    theme(axis.line=element_blank(), axis.text=element_blank(),
          axis.ticks=element_blank(),
          legend.position = "None") 
    
  
  name = paste(h,".png", sep="")
  ggsave(name, device = "png",width = 10, height = 10,unit="cm")

}
