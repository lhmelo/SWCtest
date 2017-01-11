#Code from software carpentry workshop 2017-01-11
#

x <- 1/40

#create vector; vectors contain only one type of element (number, string etc.)
y <- c(1,4,9)

#if names are quoted, R reads names like strings, if not, reads them in as objects
animals <- c("dog", "cat", "monkey")

#check structure of an object
str(animals)

#if you give vector multiple element types, R will coerce the elements into a common element type.  For example, the following will all be coerced into character elements
z <- c(1, 2, "cat")

gapminder <- read.csv(file="data/gapminder.csv")
str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)

head(gapminder, n=10)


#subsetting vector----

x <- c(3,6,9,12,15)

#extract first element

x[1]
x[c(1,3)]
x[1:3]
x[ x>5 ]
#to get index of which values are greater than five.
which(x>5)

names (x) <- c("a", "b", "c", "d", "e")
#now names will be returned with values greater than 5
x[ x>5 ]


#subsetting data.frame----
#
gapminder[1,1]
gapminder[1:6, c(2,5)]
gapminder[1:6, c("continent", "pop")]
gapminder$year[4]

gapminder[gapminder$year==2007,] #to return all columns of data for the year 2007

#challenge 7 (data subsetting lesson) questions:
gapminder[gapminder$year == 1957,]
gapminder[,-c(1:4)]
gapminder[gapminder$lifeExp > 80,]
gapminder[1, c(4, 5)]

#extract rows that contain information for the years 2002 and 2007
gapminder[gapminder$year == 2002 | gapminder$year == 2007,] 
gapminder[gapminder$year %in% c(2002, 2007),] #looking for values of gapminder$year which appear in the collection containing 2002 and 2007

#data visualization----
#
library(ggplot2)

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point()

ggplot(data=gapminder, aes(x=year, y=lifeExp)) +
  geom_point()

ggplot(data=gapminder, 
       aes(x=year, y=lifeExp, color=continent)) +
  geom_point()

ggplot(data=gapminder, 
       aes(x=year, y=lifeExp, color=continent, by=country)) +
  geom_line()

ggplot(data=gapminder, 
       aes(x=year, y=lifeExp, color=continent, by=country)) +
  geom_point() +geom_line()

#in previous line, color applied to all layers.  Can apply colors to only one geom:
ggplot(data=gapminder, 
       aes(x=year, y=lifeExp, by=country)) +
  geom_point() +
  geom_line(aes(color=continent))

#Back to scatterplot:
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point()

#change y axis to log scale
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point()+
  scale_x_log10()

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) +
  #geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")

#do not show points, do no not color by continenent (all points are black)
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  #geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")

#make points transparent
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=0.5)+
  scale_x_log10()+
  geom_smooth(method="lm")

#make points orange
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=0.5, color="orange")+
  scale_x_log10()+
  geom_smooth(method="lm")

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=0.5, color="orange", pch=17)+
  scale_x_log10()+
  geom_smooth(method="lm")

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, pch=continent)) +
  geom_point(alpha=0.5, color="orange")+
  scale_x_log10()+
  geom_smooth(method="lm")

#facet plots----

ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)+
  labs(x="GDP", y="Life expectancy", title="Life expectancy by year", color="Continent")

#create a density plot of gdp per capita, filled by continent
#advanced: transform the x-axis to better visualize the spread of the data and/or add a facet layer to panel the density plots by year
#
ggplot(data=gapminder, aes(x=gdpPercap, fill=continent, color=continent)) +
  geom_density()+
  scale_x_log10()
  #facet_wrap(~year)+
  #labs(x="GDP", y="Life expectancy", title="Life expectancy by year", color="Continent")
  #
ggplot(data=gapminder, aes(x=gdpPercap,  fill=continent)) +
  geom_density(alpha=0.5)+
  scale_x_log10()+
facet_wrap(~year)
#labs(x="GDP", y="Life expectancy", title="Life expectancy by year", color="Continent")
#
#order of items in legend are listed in the order of factors.  So reorder factor levels in "continent" to reorder legend items
