install.packages(c("tidyverse","gganimate", "gifski"))
library(tidyverse)
library(gganimate)
library(gifski)

n <- 10
loc <- c(0)
current_loc <- 0

for (i in 1:n){
  rand_num <- sample(c(-1, 1), 1)
  current_loc <- current_loc + rand_num
  loc <- c(loc, current_loc)
}

print(loc)

#Base R
# Scatter Graph
plot(x=0:n,
     y=loc, 
     type="b", 
     main="1-D Random Walk [Scatter, base]",
     xlab="step",
     ylab="location",
     xaxt="n",
     yaxt="n",
     xlim=c(0,n),
     ylim=c(-n,n))
axis(side=1, at=0:n)
axis(side=2, at=-n:n)

# Number Line Graph
plot(x=loc,
     y=rep(0, length.out=n+1), 
     type="b", 
     main="1-D Random Walk [Number Line, base]",
     xlab="location",
     ylab="",
     xaxt="n",
     yaxt="n",
     xlim=c(-n,n))
axis(side=1, at=-n:n)
text(x=loc, y=rep(0.2, length.out=n+1), labels=loc)
points(x=loc[1], y=0, col="green4", pch=19)
points(x=loc[n+1], y=0, col="red", pch=19)

#ggplot
# scatter
df_scatter <- tibble(step=0:n, loc=loc)
print(df_scatter)

sc <- ggplot(
  data=df_scatter,
  mapping=aes(x=step, y=loc)
) + 
  geom_line() +
  geom_point() +
  labs(
    title="1-D Random Walk [Scatter, ggplot]",
    x="Step Number",
    y="Location",
  ) +
  scale_y_continuous(
    limits=c(-n, n),
    breaks=seq(-n, n, by=1),
    expand=expansion(mult=0.05)
  ) +
  scale_x_continuous(
    limits=c(0, n),
    breaks=seq(0, n, by=1),
    expand=expansion(mult=0.05)
  ) +
  theme_bw() +
  theme(
    plot.title=element_text(
      size=16,
      face="bold",
      hjust=0.5,
      margin=margin(t=10, b=10, unit="pt")
    )
  )
print(sc)

# number line
yax <- rep(0, length.out=n+1)
df_nl <- tibble(yax=yax, loc=loc)
df_nl$step <- 0:n
print(df_nl)

first <- head(df_nl, 1)
print(first)
last <- tail(df_nl, 1)
print(last)

nl <- ggplot(
  data=df_nl,
  mapping=aes(x=loc,y=yax) 
) + 
  geom_line() +
  geom_point() +
  geom_point(aes(group=step)) +
  geom_point(data=first, aes(color="green4"), size=2) +
  geom_point(data=last, aes(color="red"), size=2) + 
  scale_x_continuous(
    limits=c(-n, n),
    breaks=seq(-n, n, by=1),
    expand=expansion(mult=0.05)
  ) + 
  labs(
    title="1-D Random Walk [Number Line, ggplot]",
    x="location",
    color="Start/End"
  ) + 
  theme_bw() +
  theme(
    axis.title.y=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank(),
    plot.title=element_text(
      size=16,
      face="bold",
      hjust=0.5,
      margin=margin(t=10, b=10, unit="pt")
    ),
    legend.background=element_rect(color="black", linewidth=0.3)
  ) +
  scale_color_manual(values=c("green4"="green4", "red"="red"),
                     labels=c("green4"="Start", "red"="End"))
print(nl)

#Animation
nl_animated <- nl + 
  transition_reveal(step)
animation <- animate(nl_animated, nframes=100, fps=10, renderer=gifski_renderer())
print(animation)