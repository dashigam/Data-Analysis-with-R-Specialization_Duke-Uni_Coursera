# Data Analysis with R Specialization_Duke University_Coursera Course

---
Week03_Lab01 : "Introduction to R and RStudio"
---

<div id="instructions">
Complete all **Exercises**, and submit answers to **Questions** on the Coursera 
platform.
</div>

The goal of this lab is to introduce you to R and RStudio, which you'll be using
throughout the course both to learn the statistical concepts discussed in the 
course and to analyze real data and come to informed conclusions. To straighten 
out which is which: R is the name of the programming language itself and RStudio 
is a convenient interface.

As the labs progress, you are encouraged to explore beyond what the labs dictate;
a willingness to experiment will make you a much better programmer. Before we 
get to that stage, however, you need to build some basic fluency in R. Today we
begin with the fundamental building blocks of R and RStudio: the interface, 
reading in data, and basic commands.

## RStudio

Your RStudio window has four panels.

Your R Markdown file (this document) is in the upper left panel.

The panel on the lower left is where the action happens. It's called the *console*. 
Everytime you launch RStudio, it will have the same text at the top of the 
console telling you the version of R that you're running. Below that information
is the *prompt*. As its name suggests, this prompt is really a request, a 
request for a command. Initially, interacting with R is all about typing commands
and interpreting the output. These commands and their syntax have evolved over
decades (literally) and now provide what many users feel is a fairly natural way
to access data and organize, describe, and invoke statistical computations.

The panel in the upper right contains your *workspace* as well as a history of 
the commands that you've previously entered. 

Any plots that you generate will show up in the panel in the lower right corner. 
This is also where you can browse your files, access help, manage packages, etc.


## R Packages

R is an open-source programming language, meaning that users can contribute
packages that make our lives easier, and we can use them for free. For this lab,
and many others in the future, we will use the following R packages:

- `statsr`: for data files and functions used in this course
- `dplyr`: for data wrangling
- `ggplot2`: for data visualization

You should have already installed these packages using commands like 
`install.packages` and `install_github`.

Next, you need to load the packages in your working environment. We do this with
the `library` function. Note that you only need to **install** packages once, but
you need to **load** them each time you relaunch RStudio.

```{r load-packages, message = FALSE}
library(dplyr)
library(ggplot2)
library(statsr)
```

To do so, you can 

- click on the green arrow at the top of the code chunk in the R Markdown (Rmd) 
file, or
- highlight these lines, and hit the **Run** button on the upper right corner of the 
pane, or
- type the code in the console.

Going forward you will be asked to load any relevant packages at the beginning
of each lab.

## Dataset 1: Dr. Arbuthnot's Baptism Records

To get you started, run the following command to load the data.

```{r load-abrbuthnot-data}
data(arbuthnot)
```

To do so, once again, you can 

- click on the green arrow at the top of the code chunk in the R Markdown (Rmd) 
file, or
- put your cursor on this line, and hit the **Run** button on the upper right 
corner of the pane, or
- type the code in the console.

This command instructs R to load some data. The Arbuthnot baptism counts for boys 
and girls. You should see that the workspace area in the upper righthand corner of 
the RStudio window now lists a data set called `arbuthnot` that has 82 observations 
on 3 variables. As you interact with R, you will create a series of objects. 
Sometimes you load them as we have done here, and sometimes you create them yourself 
as the byproduct of a computation or some analysis you have performed.

The Arbuthnot data set refers to Dr. John Arbuthnot, an 18<sup>th</sup> century 
physician, writer, and mathematician. He was interested in the ratio of newborn
boys to newborn girls, so he gathered the baptism records for children born in
London for every year from 1629 to 1710. We can take a look at the data by 
typing its name into the console.

```{r view-data}
arbuthnot
```

However printing the whole dataset in the console is not that useful. 
One advantage of RStudio is that it comes with a built-in data viewer. Click on
the name `arbuthnot` in the *Environment* pane (upper right window) that lists 
the objects in your workspace. This will bring up an alternative display of the 
data set in the *Data Viewer* (upper left window). You can close the data viewer
by clicking on the *x* in the upper lefthand corner.

What you should see are four columns of numbers, each row representing a 
different year: the first entry in each row is simply the row number (an index 
we can use to access the data from individual years if we want), the second is 
the year, and the third and fourth are the numbers of boys and girls baptized 
that year, respectively. Use the scrollbar on the right side of the console 
window to examine the complete data set.

Note that the row numbers in the first column are not part of Arbuthnot's data. 
R adds them as part of its printout to help you make visual comparisons. You can
think of them as the index that you see on the left side of a spreadsheet. In 
fact, the comparison to a spreadsheet will generally be helpful. R has stored 
Arbuthnot's data in a kind of spreadsheet or table called a *data frame*.

You can see the dimensions of this data frame by typing:

```{r dim-data}
dim(arbuthnot)
```

This command should output `[1] 82 3`, indicating that there are 82 rows and 3 
columns (we'll get to what the `[1]` means in a bit), just as it says next to 
the object in your workspace. You can see the names of these columns (or 
variables) by typing:

```{r names-data}
names(arbuthnot)
```

1. How many variables are included in this data set? 
<ol>
<li> 2 </li>
<li> 3 </li>
<li> 4 </li>
<li> 82 </li>
<li> 1710 </li>
</ol>

<div id="exercise">
**Exercise**: What years are included in this dataset? Hint: Take a look at the year 
variable in the Data Viewer to answer this question.
</div>

You should see that the data frame contains the columns `year`,  `boys`, and 
`girls`. At this point, you might notice that many of the commands in R look a 
lot like functions from math class; that is, invoking R commands means supplying
a function with some number of arguments. The `dim` and `names` commands, for 
example, each took a single argument, the name of a data frame.

<div id="boxedtext">
**Tip: ** If you use the up and down arrow keys, you can scroll through your 
previous commands, your so-called command history. You can also access it 
by clicking on the history tab in the upper right panel. This will save 
you a lot of typing in the future.
</div>

### R Markdown

So far we asked you to type your commands in the console. The console is a great 
place for playing around with some code, however it is not a good place for 
documenting your work. Working in the console exclusively makes it difficult to 
document your work as you go, and reproduce it later. 

R Markdown is a great solution for this problem. And, you already have worked with 
an R Markdown document -- this lab! Going forward type the code for the questions 
in the code chunks provided in the R Markdown (Rmd) document for the lab, and **Knit**
the document to see the results.

### Some Exploration

Let's start to examine the data a little more closely. We can access the data in
a single column of a data frame separately using a command like

```{r view-boys}
arbuthnot$boys
```

This command will only show the number of boys baptized each year. The dollar
sign basically says "go to the data frame that comes before me, and find the 
variable that comes after me".

2. What command would you use to extract just the counts of girls born? 
<ol>
<li> `arbuthnot$boys` </li>
<li> `arbuthnot$girls` </li>
<li> `girls` </li>
<li> `arbuthnot[girls]` </li>
<li> `$girls` </li>
</ol>

```{r extract-counts-of-girls-born}
# type your code for the Question 2 here, and Knit

```

Notice that the way R has printed these data is different. When we looked at the
complete data frame, we saw 82 rows, one on each line of the display. These data
are no longer structured in a table with other variables, so they are displayed 
one right after another. Objects that print out in this way are called vectors; 
they represent a set of numbers. R has added numbers in [brackets] along the left
side of the printout to indicate locations within the vector. For example, in the arbuthnot$boys vector, 5218  follows [1], indicating that 5218 is the first entry in the vector. And if [43] starts a line, then that would mean the first number on that line would represent the 43rd entry in the vector.

R has some powerful functions for making graphics. We can create a simple plot 
of the number of girls baptized per year with the command

```{r plot-girls-vs-year}
ggplot(data = arbuthnot, aes(x = year, y = girls)) +
  geom_point()
```

Before we review the code for this plot, let's summarize the trends we see in the 
data.

1. Which of the following best describes the number of girls baptised over the years included in this dataset? 
<ol>
<li> There appears to be no trend in the number of girls baptised from 1629 to 1710. </li>
<li> There is initially an increase in the number of girls baptised, which peaks around 1640. After 1640 there is a decrease in the number of girls baptised, but the number begins to increase again in 1660. Overall the trend is an increase in the number of girls baptised. </li>
<li> There is initially an increase in the number of girls baptised. This number peaks around 1640 and then after 1640 the number of girls baptised decreases. </li>
<li> The number of girls baptised has decreased over time. </li>
<li> There is an initial increase in the number of girls baptised but this number appears to level around 1680 and not change after that time point. </li>
</ol>

Back to the code... We use the `ggplot()` function to build plots. If you run the 
plotting code in your console, you should see the plot appear under the *Plots* tab 
of the lower right panel of RStudio. Notice that the command above again looks like 
a function, this time with arguments separated by commas. 

- The first argument is always the dataset. 
- Next, we provide thevariables from the dataset to be assigned to `aes`thetic 
elements of the plot, e.g. the x and the y axes. 
- Finally, we use another layer, separated by a `+` to specify the `geom`etric 
object for the plot. Since we want to scatterplot, we use `geom_point`.

You might wonder how you are supposed to know the syntax for the `ggplot` function. 
Thankfully, R documents all of its functions extensively. To read what a function 
does and learn the arguments that are available to you, just type in a question mark 
followed by the name of the function that you're interested in. Try the following in
your console:

```{r plot-help, tidy = FALSE}
?ggplot
```

Notice that the help file replaces the plot in the lower right panel. You can 
toggle between plots and help files using the tabs at the top of that panel. 

<div id="boxedtext">
More extensive help for plotting with the `ggplot2` package can be found at 
http://docs.ggplot2.org/current/. The best (and easiest) way to learn the syntax is 
to take a look at the sample plots provided on that page, and modify the code 
bit by bit until you get achieve the plot you want.
</div>

### R as a big calculator

Now, suppose we want to plot the total number of baptisms. To compute this, we 
could use the fact that R is really just a big calculator. We can type in 
mathematical expressions like

```{r calc-total-bapt-numbers}
5218 + 4683
```

to see the total number of baptisms in 1629. We could repeat this once for each 
year, but there is a faster way. If we add the vector for baptisms for boys to 
that of girls, R will compute all sums simultaneously.

```{r calc-total-bapt-vars}
arbuthnot$boys + arbuthnot$girls
```

What you will see are 82 numbers (in that packed display, because we aren’t 
looking at a data frame here), each one representing the sum we’re after. Take a
look at a few of them and verify that they are right.

### Adding a new variable to the data frame

We'll be using this new vector to generate some plots, so we'll want to save it 
as a permanent column in our data frame.

```{r calc-total-bapt-vars-save}
arbuthnot <- arbuthnot %>%
  mutate(total = boys + girls)
```

What in the world is going on here? The `%>%` operator is called the **piping** 
operator. Basically, it takes the output of the current line and pipes it into 
the following line of code.

<div id="boxedtext">
**A note on piping: ** Note that we can read these three lines of code as the following: 

*"Take the `arbuthnot` dataset and **pipe** it into the `mutate` function. 
Using this mutate a new variable called `total` that is the sum of the variables
called `boys` and `girls`. Then assign this new resulting dataset to the object
called `arbuthnot`, i.e. overwrite the old `arbuthnot` dataset with the new one
containing the new variable."*

This is essentially equivalent to going through each row and adding up the boys 
and girls counts for that year and recording that value in a new column called
total.
</div>

<div id="boxedtext">
**Where is the new variable? ** When you make changes to variables in your dataset, 
click on the name of the dataset again to update it in the data viewer.
</div>

You'll see that there is now a new column called `total` that has been tacked on
to the data frame. The special symbol `<-` performs an *assignment*, taking the 
output of one line of code and saving it into an object in your workspace. In 
this case, you already have an object called `arbuthnot`, so this command updates
that data set with the new mutated column.

We can make a plot of the total number of baptisms per year with the following command.

```{r plot-total-vs-year-line}
ggplot(data = arbuthnot, aes(x = year, y = total)) +
  geom_line()
```

Note that using `geom_line()` instead of `geom_point()` results in a line plot instead
of a scatter plot. You want both? Just layer them on:

```{r plot-total-vs-year-line-and-point}
ggplot(data = arbuthnot, aes(x = year, y = total)) +
  geom_line() +
  geom_point()
```

<div id="exercise">
**Exercise**: Now, generate a plot of the proportion of boys born over time. What 
do you see? 
</div>

```{r plot-proportion-of-boys-over-time}
# type your code for the Exercise here, and Knit

```

Finally, in addition to simple mathematical operators like subtraction and 
division, you can ask R to make comparisons like greater than, `>`, less than,
`<`, and equality, `==`. For example, we can ask if boys outnumber girls in each 
year with the expression

```{r boys-more-than-girls}
arbuthnot <- arbuthnot %>%
  mutate(more_boys = boys > girls)
```

This command add a new variable to the `arbuthnot` data frame containing the values
of either `TRUE` if that year had more boys than girls, or `FALSE` if that year 
did not (the answer may surprise you). This variable contains different kind of 
data than we have considered so far. All other columns in the `arbuthnot` data 
frame have values are numerical (the year, the number of boys and girls). Here, 
we've asked R to create *logical* data, data where the values are either `TRUE` 
or `FALSE`. In general, data analysis will involve many different kinds of data 
types, and one reason for using R is that it is able to represent and compute 
with many of them.


## Dataset 2: Present birth records

In the previous few pages, you recreated some of the displays and preliminary 
analysis of Arbuthnot's baptism data. Next you will do a similar analysis, 
but for present day birth records in the United States. Load up the 
present day data with the following command.

```{r load-present-data}
data(present)
```

The data are stored in a data frame called `present` which should now be loaded in 
your workspace.

4. How many variables are included in this data set?
<ol>
<li> 2 </li>
<li> 3 </li>
<li> 4 </li>
<li> 74 </li>
<li> 2013 </li>
</ol>

```{r variables-in-present}
# type your code for Question 4 here, and Knit

```

<div id="exercise">
**Exercise**: What years are included in this dataset? **Hint:** Use the `range` 
function and `present$year` as its argument.
</div>

```{r years-in-present-data}
# type your code for Exercise here, and Knit

```

5. Calculate the total number of births for each year and store these values in a new 
variable called `total` in the `present` dataset. Then, calculate the proportion of 
boys born each year and store these values in a new variable called `prop_boys` in 
the same dataset. Plot these values over time and based on the plot determine if the 
following statement is true or false: The proportion of boys born in the US has 
decreased over time. 
<ol>
<li> True </li>
<li> False </li>
</ol>

```{r prop-boys-over-time}
# type your code for Question 5 here, and Knit

```


6. Create a new variable called `more_boys` which contains the value of either `TRUE` 
if that year had more boys than girls, or `FALSE` if that year did not. Based on this 
variable which of the following statements is true? 
<ol>
<li> Every year there are more girls born than boys. </li>
<li> Every year there are more boys born than girls. </li>
<li> Half of the years there are more boys born, and the other half more girls born. </li>
</ol>

```{r more-boys-per-year}
# type your code for Question 6 here, and Knit

```


7. Calculate the boy-to-girl ratio each year, and store these values in a new variable called `prop_boy_girl` in the `present` dataset. Plot these values over time. Which of the following best describes the trend? 
<ol>
<li> There appears to be no trend in the boy-to-girl ratio from 1940 to 2013. </li>
<li> There is initially an increase in boy-to-girl ratio, which peaks around 1960. After 1960 there is a decrease in the boy-to-girl ratio, but the number begins to increase in the mid 1970s. </li>
<li> There is initially a decrease in the boy-to-girl ratio, and then an increase between 1960 and 1970, followed by a decrease. </li>
<li> The boy-to-girl ratio has increased over time. </li>
<li> There is an initial decrease in the boy-to-girl ratio born but this number appears to level around 1960 and remain constant since then. </li>
</ol>

```{r prop-boy-girl-over-time}
# type your code for Question 7 here, and Knit

```

8. In what year did we see the most total number of births in the U.S.? *Hint:* Sort 
your dataset in descending order based on the `total` column. You can do this 
interactively in the data viewer by clicking on the arrows next to the variable 
names. Or to arrange the data in a descenting order with new function: `descr` (for 
descending order).
<ol>
<li> 1940 </li>
<li> 1957 </li>
<li> 1961 </li>
<li> 1991 </li>
<li> 2007 </li>
</ol>

```{r most-total-births}
# type your code for Question 8 here
# sample code is provided below, edit as necessary, uncomment, and then Knit
#present %>%
#  mutate(total = ?) %>%
#  arrange(desc(total))
```

## Resources for learning R and working in RStudio

That was a short introduction to R and RStudio, but we will provide you with more
functions and a more complete sense of the language as the course progresses. You 
might find the following tips and resources helpful.

- In this course we will be using the `dplyr` (for data wrangling) and `ggplot2` (for 
data visualization) extensively. If you are googling for R code, make sure
to also include these package names in your search query. For example, instead
of googling "scatterplot in R", google "scatterplot in R with ggplot2".

- The following cheathseets may come in handy throughout the course. Note that some 
of the code on these cheatsheets may be too advanced for this course, however 
majority of it will become useful as you progress through the course material.
    - [Data wrangling cheatsheet](http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)
    - [Data visualization cheatsheet](http://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf)
    - [R Markdown](http://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf)

- While you will get plenty of exercise working with these packages in the labs of 
this course, if you would like further opportunities to practice we recommend 
checking out the relevant courses at [DataCamp](https://www.datacamp.com/courses).

<div id="license">
This is a derivative of an [OpenIntro](https://www.openintro.org/stat/labs.php) lab, and is released under a [Attribution-NonCommercial-ShareAlike 3.0 United States](https://creativecommons.org/licenses/by-nc-sa/3.0/us/) license.
</div>

---

# Week5_Lab02 : "Introduction to data"

---

<div id="instructions">
Complete all **Exercises**, and submit answers to **Questions** on the Coursera 
platform.
</div>

Some define statistics as the field that focuses on turning information into knowledge. The first step in that process is to summarize and describe the raw information - the data. In this lab we explore flights, specifically a random sample of domestic flights that departed from the three major New York City airport in 2013. We will generate simple graphical and numerical summaries of data on these flights and explore delay times. As this is a large data set, along the way you'll also learn the indispensable skills of data processing and subsetting.

## Getting started

### Load packages

In this lab we will explore the data using the `dplyr` package and visualize it 
using the `ggplot2` package for data visualization. The data can be found in the
companion package for this course, `statsr`.

Let's load the packages.

```{r load-packages, message=FALSE}
library(statsr)
library(dplyr)
library(ggplot2)
```

### Data

The [Bureau of Transportation Statistics](http://www.rita.dot.gov/bts/about/) 
(BTS) is a statistical agency that is a part of the Research and Innovative 
Technology Administration (RITA). As its name implies, BTS collects and makes 
available transportation data, such as the flights data we will be working with 
in this lab.

We begin by loading the `nycflights` data frame. Type the following in your console
to load the data:

```{r load-data}
data(nycflights)
```

The data frame containing `r nrow(nycflights)` flights that shows up in your 
workspace is a *data matrix*, with each row representing an *observation* and each 
column representing a *variable*. R calls this data format a **data frame**, which is 
a term that will be used throughout the labs.

To view the names of the variables, type the command

```{r names}
names(nycflights)
```

This returns the names of the variables in this data frame. The **codebook**
(description of the variables) is included below. This information can also be
found in the help file for the data frame which can be accessed by typing
`?nycflights` in the console.

- `year`, `month`, `day`: Date of departure
- `dep_time`, `arr_time`: Departure and arrival times, local timezone.
- `dep_delay`, `arr_delay`: Departure and arrival delays, in minutes. Negative times represent early departures/arrivals.
- `carrier`: Two letter carrier abbreviation.
    + `9E`:           Endeavor Air Inc.
    + `AA`:      American Airlines Inc.
    + `AS`:        Alaska Airlines Inc.
    + `B6`:             JetBlue Airways
    + `DL`:        Delta Air Lines Inc.
    + `EV`:    ExpressJet Airlines Inc.
    + `F9`:      Frontier Airlines Inc.
    + `FL`: AirTran Airways Corporation
    + `HA`:      Hawaiian Airlines Inc.
    + `MQ`:                   Envoy Air
    + `OO`:       SkyWest Airlines Inc.
    + `UA`:       United Air Lines Inc.
    + `US`:             US Airways Inc.
    + `VX`:              Virgin America
    + `WN`:      Southwest Airlines Co.
    + `YV`:          Mesa Airlines Inc.
- `tailnum`: Plane tail number
- `flight`: Flight number
- `origin`, `dest`: Airport codes for origin and destination. (Google can help
you with what code stands for which airport.)
- `air_time`: Amount of time spent in the air, in minutes.
- `distance`: Distance flown, in miles.
- `hour`, `minute`: Time of departure broken in to hour and minutes.

A very useful function for taking a quick peek at your data frame, and viewing
its dimensions and data types is `str`, which stands for **str**ucture.

```{r str}
str(nycflights)
```

The `nycflights` data frame is a massive trove of information. Let's think about 
some questions we might want to answer with these data:

- We might want to find out how delayed flights headed to a particular 
destination tend to be. 
- We might want to evaluate how departure delays vary over months. 
- Or we might want to determine which of the three major NYC airports has a better 
on time percentage for departing flights.

### Seven verbs

The `dplyr` package offers seven verbs (functions) for basic data 
manipulation:

- `filter()`
- `arrange()`
- `select()` 
- `distinct()`
- `mutate()`
- `summarise()`
- `sample_n()`

We will use some of these functions in this lab, and learn about others in a 
future lab.


## Analysis

### Departure delays in flights to Raleigh-Durham (RDU)

We can examine the distribution of departure delays of all flights with a 
histogram.

```{r hist-dep-delay}
ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram()
```

This function says to plot the `dep_delay` variable from the `nycflights` data frame on the x-axis. It also defines a `geom` (short for geometric object), which describes the type of plot you will produce. Histograms are generally a very good way to see the shape of a single distribution, but that shape can change depending on how the data is split between the different bins. You can easily define the binwidth you want to use:

```{r hist-dep-delay-bins}
ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram(binwidth = 15)
ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram(binwidth = 150)
```

<div id="exercise">
**Exercise**: How do these three histograms with the various binwidths compare?
</div>

If we want to focus on departure delays of flights headed to RDU only, we need to first `filter` the data for flights headed to RDU (`dest == "RDU"`) and then make a histogram of only departure delays of only those flights.

```{r rdu-flights-hist}
rdu_flights <- nycflights %>%
  filter(dest == "RDU")
ggplot(data = rdu_flights, aes(x = dep_delay)) +
  geom_histogram()
```

Let's decipher these three lines of code:

- Line 1: Take the `nycflights` data frame, `filter` for flights headed to RDU, and 
save the result as a new data frame called `rdu_flights`.
    + `==` means "if it's equal to".
    + `RDU` is in quotation marks since it is a character string.
- Line 2: Basically the same `ggplot` call from earlier for making a histogram, except that it uses the data frame for flights headed to RDU instead of all flights.

<div id="boxedtext">
**Logical operators: ** Filtering for certain observations (e.g. flights from a particular airport) is often of interest in data frames where we might want to examine observations with certain characteristics separately from the rest of the data. To do so we use the `filter` function and a series of **logical operators**. The most commonly used logical operators for data analysis are as follows:

- `==` means "equal to"
- `!=` means "not equal to"
- `>` or `<` means "greater than" or "less than"
- `>=` or `<=` means "greater than or equal to" or "less than or equal to"
</div>

We can also obtain numerical summaries for these flights:

```{r rdu-flights-summ}
rdu_flights %>%
  summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())
```

Note that in the `summarise` function we created a list of two elements. The names of these elements are user defined, like `mean_dd`, `sd_dd`, `n`, and you could customize these names as you like (just don't use spaces in your names). Calculating these summary statistics also require that you know the function calls. Note that `n()` reports the sample size.

<div id="boxedtext">
**Summary statistics: ** Some useful function calls for summary statistics for a single numerical variable are as follows:

- `mean`
- `median`
- `sd`
- `var`
- `IQR`
- `range`
- `min`
- `max`
</div>

We can also filter based on multiple criteria. Suppose we are interested in
flights headed to San Francisco (SFO) in February:

```{r}
sfo_feb_flights <- nycflights %>%
  filter(dest == "SFO", month == 2)
```

Note that we can separate the conditions using commas if we want flights that are both headed to SFO **and** in February. If we are interested in either flights headed to SFO **or** in February we can use the `|` instead of the comma.

1. Create a new data frame that includes flights headed to SFO in February, and save this data frame as `sfo_feb_flights`. How many flights meet these criteria? 
<ol>
<li> 68 </li> 
<li> 1345 </li> 
<li> 2286 </li> 
<li> 3563 </li>
<li> 32735 </li>
</ol>

```{r sfo-feb-flights}
# type your code for Question 1 here, and Knit

```


2. Make a histogram and calculate appropriate summary statistics for **arrival** 
delays of `sfo_feb_flights`. Which of the following is false? 
<ol>
<li> The distribution is unimodal. </li> 
<li> The distribution is right skewed. </li> 
<li> No flight is delayed more than 2 hours. </li> 
<li> The distribution has several extreme values on the right side. </li>
<li> More than 50% of flights arrive on time or earlier than scheduled. </li>
</ol>

```{r sfo-feb-flights-arrival-delays}
# type your code for Question 2 here, and Knit

```

Another useful functionality is being able to quickly calculate summary statistics for various groups in your data frame. For example, we can modify the above command using the `group_by` function to get the same summary stats for each origin airport:

```{r summary-custom-list-origin}
rdu_flights %>%
  group_by(origin) %>%
  summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())
```

Here, we first grouped the data by `origin`, and then calculated the summary statistics.

3.  Calculate the median and interquartile range for `arr_delay`s of flights in the `sfo_feb_flights` data frame, grouped by carrier. Which carrier has the hights IQR of arrival delays? 
<ol>
<li> American Airlines </li> 
<li> JetBlue Airways </li> 
<li> Virgin America </li> 
<li> Delta and United Airlines </li>
<li> Frontier Airlines </li>
</ol>

```{r sfo-feb-flights-arrival-delays-carrier}
# type your code for Question 3 here, and Knit

```

### Departure delays over months

Which month would you expect to have the highest average delay departing from an NYC airport?

Let's think about how we would answer this question:

- First, calculate monthly averages for departure delays. With the new language we are learning, we need to
    + `group_by` months, then
    + `summarise` mean departure delays.
- Then, we need to `arrange` these average delays in `desc`ending order

```{r mean-dep-delay-months}
nycflights %>%
  group_by(month) %>%
  summarise(mean_dd = mean(dep_delay)) %>%
  arrange(desc(mean_dd))
```

4.  Which month has the highest average departure delay from an NYC airport? 
<ol>
<li> January </li> 
<li> March </li> 
<li> July </li> 
<li> October </li>
<li> December </li>
</ol>

```{r highest-avg-dep-delay-month}
# type your code for Question 4 here, and Knit

```


5.  Which month has the highest median departure delay from an NYC airport?
<ol>
<li> January </li> 
<li> March </li> 
<li> July </li> 
<li> October </li>
<li> December </li>
</ol>

```{r highest-median-dep-delay-month}
# type your code for Question 5 here, and Knit

```


6.  Is the mean or the median a more reliable measure for deciding which month(s) to avoid flying if you really dislike delayed flights, and why? 
<ol>
<li> Mean would be more reliable as it gives us the true average. </li> 
<li> Mean would be more reliable as the distribution of delays is symmetric. </li> 
<li> Median would be more reliable as the distribution of delays is skewed. </li> 
<li> Median would be more reliable as the distribution of delays is symmetric. </li>
<li> Both give us useful information. </li>
</ol>


We can also visualize the distributions of departure delays across months using side-by-side box plots:

```{r delay-month-box}
ggplot(nycflights, aes(x = factor(month), y = dep_delay)) +
  geom_boxplot()
```

There is some new syntax here: We want departure delays on the y-axis and the months on the x-axis to produce side-by-side box plots. Side-by-side box plots require a categorical variable on the x-axis, however in the data frame `month` is stored as a numerical variable (numbers 1 - 12). Therefore we can force R to treat this variable as categorical, what R calls a **factor**, variable with `factor(month)`.

### On time departure rate for NYC airports

Suppose you will be flying out of NYC and want to know which of the three major NYC airports has the best on time departure rate of departing flights. Suppose also that for you a flight that is delayed for less than 5 minutes is basically "on time". You consider any flight delayed for 5 minutes of more to be 
"delayed".

In order to determine which airport has the best on time departure rate, we need to 

- first classify each flight as "on time" or "delayed",
- then group flights by origin airport,
- then calculate on time departure rates for each origin airport,
- and finally arrange the airports in descending order for on time departure percentage.

Let's start with classifying each flight as "on time" or "delayed" by creating a new variable with the `mutate` function.

```{r dep-type}
nycflights <- nycflights %>%
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))
```

The first argument in the `mutate` function is the name of the new variable
we want to create, in this case `dep_type`. Then if `dep_delay < 5` we classify 
the flight as `"on time"` and `"delayed"` if not, i.e. if the flight is delayed 
for 5 or more minutes.

Note that we are also overwriting the `nycflights` data frame with the new 
version of this data frame that includes the new `dep_type` variable.

We can handle all the remaining steps in one code chunk:

```{r}
nycflights %>%
  group_by(origin) %>%
  summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%
  arrange(desc(ot_dep_rate))
```

**The summarise step is telling R to count up how many records of the currently found group are on time - sum(dep_type == "on time”) - and divide that result by the total number of elements in the currently found group - n() - to get a proportion, then to store the answer in a new variable called ot_dep_rate.**

7.  If you were selecting an airport simply based on on time departure percentage, 
which NYC airport would you choose to fly out of? 
<ol>
<li> EWR </li> 
<li> JFK </li> 
<li> LGA </li> 
</ol>

```{r on-time-dep-perc-airport}
# type your code for Question 7 here, and Knit

```

We can also visualize the distribution of on on time departure rate across 
the three airports using a segmented bar plot.

```{r}
ggplot(data = nycflights, aes(x = origin, fill = dep_type)) +
  geom_bar()
```

8.  Mutate the data frame so that it includes a new variable that contains the 
average speed, `avg_speed` traveled by the plane for each flight (in mph). What is 
the tail number of the plane with the fastest `avg_speed`? **Hint:** Average speed 
can be calculated as distance divided by number of hours of travel, and note that 
`air_time` is given in minutes. If you just want to show the `avg_speed` and 
`tailnum` and none of the other variables, use the select function at the end of your 
pipe to select just these two variables with `select(avg_speed, tailnum)`. You can 
Google this tail number to find out more about the aircraft. 
<ol>
<li> N666DN </li> 
<li> N755US </li> 
<li> N779JB </li> 
<li> N947UW </li> 
<li> N959UW </li> 
</ol>

```{r fastest-avg-speed-tailnum}
# type your code for Question 8 here, and Knit

```


9.  Make a scatterplot of `avg_speed` vs. `distance`. Which of the following is true 
about the relationship between average speed and distance. 
<ol>
<li> As distance increases the average speed of flights decreases. </li> 
<li> The relationship is linear. </li> 
<li> There is an overall postive association between distance and average speed.</li> 
<li> There are no outliers. </li> 
<li> The distribution of distances are uniform over 0 to 5000 miles. </li> 
</ol>

```{r avg-speed-dist-scatter}
# type your code for Question 9 here, and Knit

```


10.  Suppose you define a flight to be "on time" if it gets to the destination on 
time or earlier than expected, regardless of any departure delays. Mutate the data 
frame to create a new variable called `arr_type` with levels `"on time"` and 
`"delayed"` based on this definition. Then, determine the on time arrival percentage 
based on whether the flight departed on time or not. What proportion of flights  that 
were `"delayed"` departing arrive `"on time"`? 
[NUMERIC INPUT]

```{r on-time-arr-perc}
# type your code for Question 10 here, and Knit

```
---
# Week7_Lab03: "Probability"

---

<div id="instructions">
Complete all **Exercises**, and submit answers to **Questions** on the Coursera 
platform.
</div>

## Hot Hands

Basketball players who make several baskets in succession are described as 
having a *hot hand*. Fans and players have long believed in the hot hand 
phenomenon, which refutes the assumption that each shot is independent of the 
next. However, [a 1985 paper](http://www.sciencedirect.com/science/article/pii/0010028585900106) by Gilovich, Vallone, and Tversky collected evidence
that contradicted this belief and showed that successive shots are independent 
events. This paper started a great controversy that continues to this day, as you can 
see by Googling *hot hand basketball*.

We do not expect to resolve this controversy today. However, in this lab we'll 
apply one approach to answering questions like this. The goals for this lab are 
to (1) think about the effects of independent and dependent events, (2) learn 
how to simulate shooting streaks in R, and (3) to compare a simulation to actual
data in order to determine if the hot hand phenomenon appears to be real.

## Getting Started

### Load packages

In this lab we will explore the data using the `dplyr` package and visualize it 
using the `ggplot2` package for data visualization. The data can be found in the
companion package for this course, `statsr`.

Let's load the packages.

```{r load-packages, message=FALSE}
library(statsr)
library(dplyr)
library(ggplot2)
```

### Data

Our investigation will focus on the performance of one player: Kobe Bryant of 
the Los Angeles Lakers. His performance against the Orlando Magic in the 2009 
NBA finals earned him the title *Most Valuable Player* and many spectators 
commented on how he appeared to show a hot hand. Let's load some necessary files
that we will need for this lab.

```{r load-data}
data(kobe_basket)
```

This data frame contains 133 observations and 6 variables, where every
row records a shot taken by Kobe Bryant. The `shot` variable in this dataset
indicates whether the shot was a hit (`H`) or a miss (`M`).

Just looking at the string of hits and misses, it can be difficult to gauge 
whether or not it seems like Kobe was shooting with a hot hand. One way we can 
approach this is by considering the belief that hot hand shooters tend to go on 
shooting streaks. For this lab, we define the length of a shooting streak to be 
the *number of consecutive baskets made until a miss occurs*.

For example, in Game 1 Kobe had the following sequence of hits and misses from 
his nine shot attempts in the first quarter:

\[ \textrm{H M | M | H H M | M | M | M} \]

You can verify this by viewing the first 8 rows of the data in the data viewer.

Within the nine shot attempts, there are six streaks, which are separated by a 
"|" above. Their lengths are one, zero, two, zero, zero, zero (in order of 
occurrence).

1.  Fill in the blank: A streak length of 1 means one \_\_\_ followed by one miss.
<ol>
<li> hit </li>
<li> miss </li>
</ol>


2.  Fill in the blank: A streak length of 0 means one \_\_\_ which must occur after a 
miss that ended the preceeding streak.
<ol>
<li> hit </li>
<li> miss </li>
</ol>

Counting streak lengths manually for all 133 shots would get tedious, so we'll
use the custom function `calc_streak` to calculate them, and store the results
in a data frame called `kobe_streak` as the `length` variable.

```{r calc-streak-kobe}
kobe_streak <- calc_streak(kobe_basket$shot)
```

We can then take a look at the distribution of these streak lengths.

```{r plot-streak-kobe}
ggplot(data = kobe_streak, aes(x = length)) +
  geom_histogram(binwidth = 1)
```

3.  Which of the following is false about the distribution of Kobe's streak lengths 
from the 2009 NBA finals. 
<ol>
<li> The distribution of Kobe's streaks is unimodal and right skewed. </li>
<li> The typical length of a streak is 0 since the median of the distribution is at 0. </li>
<li> The IQR of the distribution is 1. 
<li> The longest streak of baskets is of length 4. </li>
<li> The shortest streak is of length 1.</li>
</ol>

## Compared to What?

We've shown that Kobe had some long shooting streaks, but are they long enough 
to support the belief that he had hot hands? What can we compare them to?

To answer these questions, let's return to the idea of *independence*. Two 
processes are independent if the outcome of one process doesn't effect the outcome 
of the second. If each shot that a player takes is an independent process, 
having made or missed your first shot will not affect the probability that you
will make or miss your second shot.

A shooter with a hot hand will have shots that are *not* independent of one 
another. Specifically, if the shooter makes his first shot, the hot hand model 
says he will have a *higher* probability of making his second shot.

Let's suppose for a moment that the hot hand model is valid for Kobe. During his
career, the percentage of time Kobe makes a basket (i.e. his shooting 
percentage) is about 45%, or in probability notation,

\[ P(\textrm{shot 1 = H}) = 0.45 \]

If he makes the first shot and has a hot hand (*not* independent shots), then 
the probability that he makes his second shot would go up to, let's say, 60%,

\[ P(\textrm{shot 2 = H} \, | \, \textrm{shot 1 = H}) = 0.60 \]

As a result of these increased probabilites, you'd expect Kobe to have longer 
streaks. Compare this to the skeptical perspective where Kobe does *not* have a
hot hand, where each shot is independent of the next. If he hit his first shot,
the probability that he makes the second is still 0.45.

\[ P(\textrm{shot 2 = H} \, | \, \textrm{shot 1 = H}) = 0.45 \]

In other words, making the first shot did nothing to effect the probability that
he'd make his second shot. If Kobe's shots are independent, then he'd have the 
same probability of hitting every shot regardless of his past shots: 45%.

Now that we've phrased the situation in terms of independent shots, let's return
to the question: how do we tell if Kobe's shooting streaks are long enough to 
indicate that he has hot hands? We can compare his streak lengths to someone
without hot hands: an independent shooter. 

## Simulations in R

While we don't have any data from a shooter we know to have independent shots, 
that sort of data is very easy to simulate in R. In a simulation, you set the 
ground rules of a random process and then the computer uses random numbers to 
generate an outcome that adheres to those rules. As a simple example, you can
simulate flipping a fair coin with the following.

```{r head-tail}
coin_outcomes <- c("heads", "tails")
sample(coin_outcomes, size = 1, replace = TRUE)
```

The vector `outcomes` can be thought of as a hat with two slips of paper in it: 
one slip says `heads` and the other says `tails`. The function `sample` draws 
one slip from the hat and tells us if it was a head or a tail. 

Run the second command listed above several times. Just like when flipping a 
coin, sometimes you'll get a heads, sometimes you'll get a tails, but in the 
long run, you'd expect to get roughly equal numbers of each.

If you wanted to simulate flipping a fair coin 100 times, you could either run 
the function 100 times or, more simply, adjust the `size` argument, which 
governs how many samples to draw (the `replace = TRUE` argument indicates we put
the slip of paper back in the hat before drawing again). Save the resulting 
vector of heads and tails in a new object called `sim_fair_coin`.

```{r sim-fair-coin}
sim_fair_coin <- sample(coin_outcomes, size = 100, replace = TRUE)
```

To view the results of this simulation, type the name of the object and then use
`table` to count up the number of heads and tails.

```{r table-sim-fair-coin}
sim_fair_coin
table(sim_fair_coin)
```

Since there are only two elements in `outcomes`, the probability that we "flip" 
a coin and it lands heads is 0.5. Say we're trying to simulate an unfair coin 
that we know only lands heads 20% of the time. We can adjust for this by adding 
an argument called `prob`, which provides a vector of two probability weights.

```{r sim-unfair-coin}
sim_unfair_coin <- sample(coin_outcomes, size = 100, replace = TRUE, 
                          prob = c(0.2, 0.8))
```

`prob = c(0.2, 0.8)` indicates that for the two elements in the `outcomes` vector,
we want to select the first one, `heads`, with probability 0.2 and the second 
one, `tails` with probability 0.8. Another way of thinking about this is to 
think of the outcome space as a bag of 10 chips, where 2 chips are labeled 
"head" and 8 chips "tail". Therefore at each draw, the probability of drawing a 
chip that says "head"" is 20%, and "tail" is 80%.

<div id="exercise">
**Exercise**: In your simulation of flipping the unfair coin 100 times, how many flips came up heads?
</div>

In a sense, we've shrunken the size of the slip of paper that says "heads", 
making it less likely to be drawn and we've increased the size of the slip of 
paper saying "tails", making it more likely to be drawn. When we simulated the 
fair coin, both slips of paper were the same size. This happens by default if 
you don't provide a `prob` argument; all elements in the `outcomes` vector have 
an equal probability of being drawn.

If you want to learn more about `sample` or any other function, recall that you 
can always check out its help file with `?sample`.


## Simulating the Independent Shooter

Simulating a basketball player who has independent shots uses the same mechanism 
that we use to simulate a coin flip. To simulate a single shot from an 
independent shooter with a shooting percentage of 50% we type,

```{r sim-basket}
shot_outcomes <- c("H", "M")
sim_basket <- sample(shot_outcomes, size = 1, replace = TRUE)
```

To make a valid comparison between Kobe and our simulated independent shooter, 
we need to align both their shooting percentage and the number of attempted shots.


<div id="exercise">
**Exercise**: What change needs to be made to the `sample` function so that it reflects a shooting percentage of 45%? Make this adjustment, then run a simulation to sample 133 shots. Assign the output of this simulation to a new object called `sim_basket`.
</div>
```{r}
# type your code for the Exercise here, and Knit

```

   
Note that we've named the new vector `sim_basket`, the same name that we gave to
the previous vector reflecting a shooting percentage of 50%. In this situation, 
R overwrites the old object with the new one, so always make sure that you don't
need the information in an old vector before reassigning its name.

With the results of the simulation saved as `sim_basket`, we have the data 
necessary to compare Kobe to our independent shooter.

Both data sets represent the results of 133 shot attempts, each with the same 
shooting percentage of 45%. We know that our simulated data is from a shooter 
that has independent shots. That is, we know the simulated shooter does not have
a hot hand.

### Comparing Kobe Bryant to the Independent Shooter

<div id="exercise">
**Exercise**: Using `calc_streak`, compute the streak lengths of `sim_basket`, and save the results in a data frame called `sim_streak`. Note that since the `sim_streak` object is just a vector and not a variable in a data frame, we don't need to first select it from a data frame like we did earlier when we calculated the streak lengths for Kobe's shots.
</div>
```{r sim-streak-lengths}
# type your code for the Exercise here, and Knit

```
   
<div id="exercise">
**Exercise**: Make a plot of the distribution of simulated streak lengths of the independent shooter. What is the typical streak length for this simulated independent shooter with a 45% shooting percentage? How long is the player's longest streak of baskets in 133 shots?
</div>
```{r plot-sim-streaks}
# type your code for the Exercise here, and Knit

```

4.  If you were to run the simulation of the independent shooter a second time, how 
would you expect its streak distribution to compare to the distribution from the 
exercise above? 
<ol>
<li> Exactly the same  </li>
<li> Somewhat similar </li>
<li> Totally different </li>
</ol>


5.  How does Kobe Bryant's distribution of streak lengths compare to the distribution 
of streak lengths for the simulated shooter? Using this comparison, do you have 
evidence that the hot hand model fits Kobe's shooting patterns?
<ol>
<li> The distributions look very similar. Therefore, there doesn't appear to be evidence for Kobe Bryant's hot hand. </li>
<li> The distributions look very similar. Therefore, there appears to be evidence for Kobe Bryant's hot hand. </li>
<li> The distributions look very different. Therefore, there doesn't appear to be evidence for Kobe Bryant's hot hand. </li>
<li> The distributions look very different. Therefore, there appears to be evidence for Kobe Bryant's hot hand. </li>
</ol>

<div id="exercise">
**Exercise**: What concepts from the course videos are covered in this lab? What 
concepts, if any, are not covered in the videos? Have you seen these concepts 
elsewhere, e.g. textbook, previous labs, or practice problems?
</div>

<div id="license">
This is a derivative of an [OpenIntro](https://www.openintro.org/stat/labs.php) lab, and is released under a [Attribution-NonCommercial-ShareAlike 3.0 United States](https://creativecommons.org/licenses/by-nc-sa/3.0/us/) license.
</div>
