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

