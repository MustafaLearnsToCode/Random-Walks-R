#Import libraries
library(tidyverse)
library(gganimate)
library(gifski)

#Variable Setup
n <- 10
steps <- matrix(c(1,0,0,1,-1,0,0,-1), nrow=4, ncol=2, byrow=TRUE)
loc <- matrix(c(0,0), ncol=2, byrow=TRUE)

#Simulating Steps
for (i in 1:n){
  rand <- sample(c(1:4), 1)
  new <- loc[nrow(loc), ] + steps[rand,]
  loc <- rbind(loc, new)
}

#Output
rownames(loc) <- NULL
print(loc)

#Graphing
df <- as.data.frame(loc)
colnames(df) <- c("x", "y")
df$step <- 0:n
print(df)

first <- df[1,]
last <- df[nrow(df),]

graph <- ggplot(
  data=df,
  mapping = aes(x=x, y=y)
) + 
  geom_path() + 
  geom_point() +
  geom_point(aes(group=step)) +
  geom_point(data=first, aes(color="green4"), size=2) +
  geom_point(data=last, aes(color="red"), size=2) +
  labs(
    title="2D Random Walk",
    color="Start/End"
  ) +
  scale_x_continuous(
    limits=c(-n, n),
    breaks=seq(-n, n, by=1)
  ) +
  scale_y_continuous(
    limits=c(-n, n),
    breaks=seq(-n, n, by=1)
  ) +
  theme_bw() +
  theme(
    plot.title=element_text(
      size=16,
      face="bold",
      hjust=0.5,
    ),
    legend.background=element_rect(color="black",linewidth=0.3) 
  ) +
  scale_color_manual(values=c("green4"="green4","red"="red"),
                     labels=c("green4"="Start", "red"="End"))

print(graph)

#animation
animated_graph <- graph +
  transition_reveal(step, keep_last=TRUE)

animation <- animate(animated_graph, nframes=100, fps=10, renderer=gifski_renderer())
print(animation)