##Dates and times in R

In this reading, you will learn how to work with dates and times in R using the lubridate package. Coming up, you will use tools in the lubridate package to convert different types of data in R into date and date-time formats.
Image of a calendar month. Each day has an analog clock featuring a different time.
Loading tidyverse and lubridate packages

Before you get started working with dates and times, you should load both tidyverse and lubridate. Lubridate is part of tidyverse. 

First, open RStudio. 

If you haven't already installed tidyverse, you can use the install.packages() function to do so: 

    install.packages("tidyverse") 

Next, load the tidyverse and lubridate packages using the library() function. First, load the core tidyverse to make it available in your current R session: 

    library(tidyverse)

Then, load the lubridate package: 

    library(lubridate)

Now you’re ready to be introduced to the tools in the lubridate package. 
Working with dates and times 

T​his section covers the data types for dates and times in R and how to convert strings to date-time formats.
Types

In R, there are three types of data that refer to an instant in time:

    A date ("2016-08-16")

    A time within a day (“20:11:59 UTC")

    And a date-time. This is a date plus a time ("2018-03-31 18:15:48 UTC")

The time is given in UTC, which stands for Universal Time Coordinated, more commonly called Universal Coordinated Time. This is the primary standard by which the world regulates clocks and time.

For example, to get the current date you can run the today() function. The date appears as year, month, and day. 

today()

#> [1] "2021-01-20"

To get the current date-time you can run the now() function. Note that the time appears to the nearest second. 

now()

#> [1] "2021-01-20 16:25:05 UTC"

When working with R, there are three ways you are likely to create date-time formats: 

    From a string

    From an individual date

    From an existing date/time object

R creates dates in the standard yyyy-mm-dd format by default. 

Let's go over each. 
Converting from strings 

Date/time data often comes as strings. You can convert strings into dates and date-times using the tools provided by lubridate. These tools automatically work out the date/time format. First, identify the order in which the year, month, and day appear in your dates. Then, arrange the letters y, m, and d in the same order. That gives you the name of the lubridate function that will parse your date. For example, for the date 2021-01-20, you use the order ymd:

ymd("2021-01-20")

When you run the function, R returns the date in yyyy-mm-dd format. 

#> [1] "2021-01-20"

It works the same way for any order. For example, month, day, and year. R still returns the date in yyyy-mm-dd format.

mdy("January 20th, 2021")

#> [1] "2021-01-20"

Or, day, month, and year. R still returns the date in yyyy-mm-dd format.

dmy("20-Jan-2021")

#> [1] "2021-01-20"

These functions also take unquoted numbers and convert them into the yyyy-mm-dd format.

ymd(20210120)

#> [1] "2021-01-20"
Creating date-time components

The ymd() function and its variations create dates. To create a date-time from a date, add an underscore and one or more of the letters h, m, and s (hours, minutes, seconds) to the name of the function:

ymd_hms("2021-01-20 20:11:59")

#> [1] "2021-01-20 20:11:59 UTC"

mdy_hm("01/20/2021 08:01")

#> [1] "2021-01-20 08:01:00 UTC"
Optional: Switching between existing date-time objects 

Finally, you might want to switch between a date-time and a date. 

You can use the function as_date() to convert a date-time to a date. For example, put the current date-time—now()—in the parentheses of the function. 

as_date(now())

#> [1] "2021-01-20"
Additional resources

To learn more about working with dates and times in R, check out the following resources:

    lubridate.tidyverse: This is the “lubridate” entry from the official tidyverse documentation, which offers a comprehensive reference guide to the various tidyverse packages. Check out this link for an overview of key concepts and functions.

    Dates and times with lubridate: Cheat Sheet: This “cheat sheet” gives you a detailed map of all the different things you can do with the lubridate package. You don’t need to know all of this information, but the cheat sheet is a useful reference for any questions you might have about working with dates and times in R. 
    
    
## Vectors and lists in R

You can save this reading for future reference. Feel free to download a PDF version of this reading below:
Vectors and lists in R.pdfPDF File
Open file

In programming, a data structure is a format for organizing and storing data. Data structures are important to understand because you will work with them frequently when you use R for data analysis. The most common data structures in the R programming language include: 

    Vectors

    Data frames

    Matrices

    Arrays

Think of a data structure like a house that contains your data. 
Image of construction workers building the foundations of a house

This reading will focus on vectors. Later on, you’ll learn more about data frames, matrices, and arrays. 

There are two types of vectors: atomic vectors and lists. Coming up, you’ll learn about the basic properties of atomic vectors and lists, and how to use R code to create them. 
Atomic vectors 

First, we will go through the different types of atomic vectors. Then, you will learn how to use R code to create, identify, and name the vectors. 

Earlier, you learned that a vector is a group of data elements of the same type, stored in a sequence in R. You cannot have a vector that contains both logicals and numerics. 

There are six primary types of atomic vectors: logical, integer, double, character (which contains strings), complex, and raw. The last two–complex and raw–aren’t as common in data analysis, so we will focus on the first four. Together, integer and double vectors are known as numeric vectors because they both contain numbers. This table summarizes the four primary types: 

Type
	

Description 
	

Example

Logical 
	

True/False 
	

TRUE

Integer 
	

Positive and negative whole values
	

3

Double 
	

Decimal values 
	

101.175

Character 
	

String/character values
	

“Coding” 



This diagram illustrates the hierarchy of relationships among these four main types of vectors:
4-level Hierarchy of vectors
Bottom: logical (arrow points to atomic), integer (arrow points to numeric), double (arrow points to numeric), character (arrow points to atomic)
Second to bottom: numeric (arrow points to atomic)
second level: atomic (arrow points to vector)
top: vector 
Creating vectors  

One way to create a vector is by using the c() function (called the “combine” function). The c() function in R combines multiple values into a vector. In R, this function is just the letter “c” followed by the values you want in your vector inside the parentheses, separated by a comma: c(x, y, z, …).

For example, you can use the c() function to store numeric data in a vector. 

c(2.5, 48.5, 101.5)

To create a vector of integers using the c() function, you must place the letter "L" directly after each number.

c(1L, 5L, 15L)

You can also create a vector containing characters or logicals. 

c(“Sara” , “Lisa” , “Anna”)

c(TRUE, FALSE, TRUE)
Determining the properties of vectors 

Every vector you create will have two key properties: type and length.  

 You can determine what type of vector you are working with by using the typeof() function. Place the code for the vector inside the parentheses of the function. When you run the function, R will tell you the type. For example: 

typeof(c(“a” , “b”))

#> [1] "character"

 Notice that the output of the typeof function in this example is “character”. Similarly, if you use the typeof function on a vector with integer values, then the output will include “integer” instead: 

typeof(c(1L , 3L))

#> [1] "integer"

You can determine the length of an existing vector–meaning the number of elements it contains–by using the length() function. In this example, we use an assignment operator to assign the vector to the variable x. Then, we apply the length() function to the variable. When we run the function, R tells us the length is 3.

x <- c(33.5, 57.75, 120.05)

length(x)

#> [1] 3

You can also check if a vector is a specific type by using an is function: is.logical(), is.double(), is.integer(), is.character(). In this example, R returns a value of TRUE because the vector contains integers. 

x <- c(2L, 5L, 11L)

is.integer(x)

#> [1] TRUE

In this example, R returns a value of FALSE because the vector does not contain characters, rather it contains logicals.

y <- c(TRUE, TRUE, FALSE)

is.character(y)

#> [1] FALSE
Naming vectors 

All types of vectors can be named. Names are useful for writing readable code and describing objects in R. You can name the elements of a vector with the names() function. As an example, let’s assign the variable x to a new vector with three elements. 

x <- c(1, 3, 5)

You can use the names() function to assign a different name to each element of the vector. 

names(x) <- c("a", "b", "c")


Now, when you run the code, R shows that the first element of the vector is named a, the second b, and the third c.

x 

#> a b c 

#> 1 3 5

Remember that an atomic vector can only contain elements of the same type. If you want to store elements of different types in the same data structure, you can use a list. 
Creating lists

Lists are different from atomic vectors because their elements can be of any type—like dates, data frames, vectors, matrices, and more. Lists can even contain other lists. 

You can create a list with the list() function. Similar to the c() function, the list() function is just list followed by the values you want in your list inside parentheses: list(x, y, z, …). In this example, we create a list that contains four different kinds of elements: character ("a"), integer (1L), double (1.5), and logical (TRUE). 

list("a", 1L, 1.5, TRUE)

Like we already mentioned, lists can contain other lists. If you want, you can even store a list inside a list inside a list—and so on. 

list(list(list(1 , 3, 5)))
Determining the structure of lists 

If you want to find out what types of elements a list contains, you can use the str() function. To do so, place the code for the list inside the parentheses of the function. When you run the function, R will display the data structure of the list by describing its elements and their types.

Let’s apply the str() function to our first example of a list. 

str(list("a", 1L, 1.5, TRUE))

We run the function, then R tells us that the list contains four elements, and that the elements consist of four different types: character (chr), integer (int), number (num), and logical (logi). 

#> List of 4

#>  $ : chr "a"

#>  $ : int 1

#>  $ : num 1.5

#>  $ : logi TRUE

Let’s use the str() function to discover the structure of our second example.  First, let’s assign the list to the variable z to make it easier to input in the str() function. 

z <- list(list(list(1 , 3, 5)))

Let’s run the function. 

str(z)

#> List of 1

#>  $ :List of 1

#>   ..$ :List of 3

#>   .. ..$ : num 1

#>   .. ..$ : num 3

#>   .. ..$ : num 5

The indentation of the $ symbols reflect the nested structure of this list. Here, there are three levels (so there is a list within a list within a list).  
Naming lists

Lists, like vectors, can be named. You can name the elements of a list when you first create it with the list() function:

list('Chicago' = 1, 'New York' = 2, 'Los Angeles' = 3)

$Chicago

[1] 1

$`New York`

[1] 2

$`Los Angeles`

[1] 3
Additional resource 

To learn more about vectors and lists, check out R for Data Science, Chapter 20: Vectors. R for Data Science is a classic resource for learning how to use R for data science and data analysis. It covers everything from cleaning to visualizing to communicating your data. If you want to get more details about the topic of vectors and lists, this chapter is a great place to start. 

## Other common data structures

In this reading, you will continue on the topic of data structures with an introduction to data frames and matrices. You will learn about the basic properties of each structure, and simple ways to make use of them using R code. You will also briefly explore files, which are often used to access and store data and related information.
Data structures

R​ecall that a data structure is like a house that contains your data.
Image of a house made up of different data folders and files.
Data frames

Data frames are the most common way of storing and analyzing data in R, so it’s important to understand what they are and how to create them. A data frame is a collection of columns–similar to a spreadsheet or SQL table. Each column has a name at the top that represents a variable, and includes one observation per row. Data frames help summarize data and organize it into a format that is easy to read and use. 

For example, the data frame below shows the “diamonds” dataset, which is one of the preloaded datasets in R. Each column contains a single variable that is related to diamonds: carat, cut, color, clarity, depth, and so on. Each row represents a single observation.
screenshot of data frame example

There are a few key things to keep in mind when you are working with data frames: 

    First, columns should be named. 

    Second, data frames can include many different types of data, like numeric, logical, or character.

    Finally, elements in the same column should be of the same type.

You will learn more about data frames later on in the program, but this is a great starting point. 

If you need to manually create a data frame in R, you can use the data.frame() function. The data.frame() function takes vectors as input. In the parentheses, enter the name of the column, followed by an equals sign, and then the vector you want to input for that column. In this example, the x column is a vector with elements 1, 2, 3, and the y column is a vector with elements 1.5, 5.5, 7.5. 

data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

If you run the function, R displays the data frame in ordered rows and columns. 

   x y

1  1 1.5

2  2 5.5

3  3 7.5

In most cases, you won’t need to manually create a data frame yourself, as you will typically import data from another source, such as a .csv file, a relational database, or a software program.
Files

Let’s go over how to create, copy, and delete files in R. For more information on working with files in R, check out R documentation: files. R documentation is a tool that helps you easily find and browse the documentation of almost all R packages on CRAN. It’s a useful reference guide for functions in R code. Let’s go through a few of the most useful functions for working with files. 

Use the dir.create function to create a new folder, or directory, to hold your files. Place the name of the folder in the parentheses of the function. 

dir.create ("destination_folder")

Use the file.create() function to create a blank file. Place the name and the type of the file in the parentheses of the function. Your file types will usually be something like .txt, .docx, or .csv.  

file.create (“new_text_file.txt”) 

file.create (“new_word_file.docx”) 

file.create (“new_csv_file.csv”) 

If the file is successfully created when you run the function, R will return a value of TRUE (if not, R will return FALSE). 

file.create (“new_csv_file.csv”)

[1] TRUE 

Copying a file can be done using the file.copy() function. In the parentheses, add the name of the file to be copied. Then, type a comma, and add the name of the destination folder that you want to copy the file to. 

file.copy (“new_text_file.txt” , “destination_folder”)

If you check the Files pane in RStudio, a copy of the file appears in the relevant folder:
screenshot of the files page in r studio

You can delete R files using the unlink() function. Enter the file’s name in the parentheses of the function.

unlink (“some_.file.csv”)
Additional resource

If you want to learn more about working with data frames, matrices, and arrays in R, check out the Data Wrangling section of Stat Education's Introduction to R course. The section includes modules on data frames, matrices, and arrays (and more), and each module contains helpful examples of key coding concepts. 

--------------------------------------------------------------------------------------------------------------------------------------
Optional: Matrices 

A matrix is a two-dimensional collection of data elements. This means it has both rows and columns. By contrast, a vector is a one-dimensional sequence of data elements. But like vectors, matrices can only contain a single data type. For example, you can’t have both logicals and numerics in a matrix. 

To create a matrix in R, you can use the matrix() function. The matrix() function has two main arguments that you enter in the parentheses. First, add a vector. The vector contains the values you want to place in the matrix. Next, add at least one matrix dimension. You can choose to specify the number of rows or the number of columns by using the code nrow = or ncol =. 

For example, imagine you want to create a 2x3 (two rows by three columns) matrix containing the values 3-8. First, enter a vector containing that series of numbers: c(3:8). Then, enter a comma. Finally, enter nrow = 2 to specify the number of rows. 

matrix(c(3:8), nrow = 2)

If you run the function, R displays a matrix with three columns and two rows (typically referred to as a “2x3”) that contain the numeric values 3, 4, 5, 6, 7, 8. R places the first value (3) of the vector in the uppermost row, and the leftmost column of the matrix, and continues the sequence from left to right. 

    [,1] [,2] [,3]

[1,]    3    5    7

[2,]    4    6    8

You can also choose to specify the number of columns (ncol = ) instead of the number of rows (nrow = ). 

matrix(c(3:8), ncol = 2)

When you run the function, R infers the number of rows automatically.

    [,1] [,2] 

[1,]    3    6    

[2,]    4    7    

[3,]    5    8   


## Available R packages

To make the most of R for your data analysis, you will need to install packages. Packages are units of reproducible R code that you can use to add more functionality to R. The best part is that the R community creates and shares packages so that other users can access them! In this reading, you will learn more about widely used packages and where to find them. 
Image of a person in a suit unloading boxes from a truck

Packages can be found in repositories, which are collections of useful packages that are ready to install. You can find repositories on Bioconductor, R-Forge, rOpenSci, or GitHub, but the most commonly used repository is the Comprehensive R Archive Network or CRAN. CRAN stores code and documentation so that you can install packages into your own RStudio space. 
Package documentation 

Packages will not only include the code itself, but also documentation that explains the package’s author, function, and any other packages that you will need to download. When you are using CRAN, you can find the package documentation in the DESCRIPTION file. 

Check out Karl Broman's R Package Primer to learn more.
Choosing the right packages

With so many packages out there, it can be hard to know which ones will be the most useful for your library or directory of installed packages. Luckily, there are some great resources out there:

    Tidyverse: the tidyverse is a collection of R packages specifically designed for working with data. It’s a standard library for most data analysts, but you can also download the packages individually. 

    Quick list of useful R packages: this is RStudio Support’s list of useful packages with installation instructions and functionality descriptions. 

    CRAN Task Views: this is an index of CRAN packages sorted by task. You can search for the type of task you need to perform and it will pull up a page with packages related to that task for you to explore.  
    
    
## File-naming conventions

An important part of cleaning data is making sure that all of your files are accurately named. Although individual preferences will vary a bit, most analysts generally agree that file names should be accurate, consistent, and easy to read. This reading provides some general guidelines for you to follow when naming or renaming your data files. 
A tall filing cabinet with one open drawer. Manila files are spread across the floor below.
What’s in a (file)name?

When you first start working with R (or any other programming language, analysis tool, or platform, for that matter), you or your company should establish naming conventions for your files. This helps ensure that anyone reviewing your analysis–yourself included–can quickly and easily find what they need. Next are some helpful “do’s” and “don’ts” to keep in mind when naming your files.
Do

    Keep your filenames to a reasonable length

    Use underscores and hyphens for readability

    Start or end your filename with a letter or number

    Use a standard date format when applicable; example: YYYY-MM-DD

    Use filenames for related files that work well with default ordering; example: in chronological order, or logical order using numbers first

E​xamples of good filenames

2020-04-10_march-attendance.R

2021_03_20_new_customer_ids.csv

01_data-sales.html

02_data-sales.html
Don't

    Use unnecessary additional characters in filenames

    Use spaces or “illegal” characters; examples: &, %, #, <, or >

    Start or end your filename with a symbol

    Use incomplete or inconsistent date formats; example: M-D-YY

    Use filenames for related files that do not work well with default ordering; examples: a random system of numbers or date formats, or using letters first

E​xamples of filenames to avoid

4102020marchattendance<workinprogress>.R

_20210320*newcustomeridsforfebonly.csv

firstfile_for_datasales/1-25-2020.html

secondfile_for_datasales/2-5-2020.html
Additional resources

These resources include more info about some of the file naming standards discussed here, and provide additional insights into best practices.

    How to name files: this resource from Speaker Deck is a playful take on file naming. It includes several slides with tips and examples for how to accurately name lots of different types of files. You will learn why filenames should be both machine readable and human readable. 

    File naming and structure: this resource from the Princeton University Library provides an easy-to-scan list of best practices, considerations, and examples for developing file naming conventions. 


#### Cleaning 
rename_with()
clean_name()


## Working with biased data

https://www.rdocumentation.org/packages/SimDesign/versions/2.2/topics/bias

Every data analyst will encounter an element of bias at some point in the data analysis process. That’s why it’s so important to understand how to identify and manage biased data whenever possible. You might recall we explored bias in detail in Course 3 of this program. In this reading, you will read a real-life example of an analyst who discovered bias in their data, and learn how they used R to address it.  
Addressing biased data with R
A woman is standing, holding a speech bubble. Several other speech bubbles are on the ground near her.

This scenario was shared by a quantitative analyst who collects data from people all over the world. They explain how they discovered bias in their data, and how they used R to address it:

“I work on a team that collects survey-like data. One of the tasks my team does is called a side-by-side comparison. For example, we might show users two ads side-by-side at the same time. In our survey, we ask which of the two ads they prefer. In one case, after many iterations, we were seeing consistent bias in favor of the first item. There was also a measurable decrease in the preference for an item if we swapped its position to second.

So we decided to add randomization to the position of the ads using R. We wanted to make sure that the items appeared in the first and second positions with similar frequencies. We used sample() to inject a randomization element into our R programming. In R, the sample() function allows you to take a random sample of elements from a data set. Adding this piece of code shuffled the rows in our data set randomly. So when we presented the ads to users, the positions of the ads were now random and controlled for bias. This made the survey more effective and the data more reliable.”
Key takeaways

The sample() function is just one of many functions and methods in R that you can use to address bias in your data. Depending on the kind of analysis you are conducting, you might need to incorporate some advanced processes in your programming. Although this program won’t cover those kinds of processes in detail, you will likely learn more about them as you get more experience in the data analytics field. 

To learn more about bias and data ethics, check out these resources: 

    Bias function: This web page is a good starting point to learn about how the bias function in R can help you identify and manage bias in your analysis.

    Data Science Ethics: This online course provides slides, videos, and exercises to help you learn more about ethics in the world of data analytics. It includes information about data privacy, misrepresentation in data, and applying ethics to your visualizations.
    
    
## More about tibbles

In this reading, you will learn about tibbles, which are a super useful tool for organizing data in R. You will get a review of what tibbles are, how they differ from standard data frames, and how to create them in R. 
Tibbles 
Image of a person sitting down holding an empty frame. There are other empty picture frames on the floor around them.

Tibbles are a little different from standard data frames. A data frame is a collection of columns, like a spreadsheet or a SQL table. Tibbles are like streamlined data frames that are automatically set to pull up only the first 10 rows of a dataset, and only as many columns as can fit on the screen. This is really useful when you’re working with large sets of data. Unlike data frames, tibbles never change the names of your variables, or the data types of your inputs. Overall, you can make more changes to data frames, but tibbles are easier to use. The tibble package is part of the core tidyverse. So, if you’ve already installed the tidyverse, you have what you need to start working with tibbles. 
Creating tibbles 

Now, let’s go through an example of how to create a tibble in R. You can use the pre-loaded diamonds dataset that you’re familiar with from earlier videos. As a reminder, the diamonds dataset includes information about different diamond qualities, like carat, cut, color, clarity, and more. 

You can load the dataset with the data() function using the following code:

library(tidyverse) 

data(diamonds)

Then, let’s add the data frame to our data viewer in RStudio with the View() function. 

View(diamonds)

The dataset has 10 columns and thousands of rows. This image displays part of the data frame:
Image of the first 21 rows of the “diamonds” dataset in the RStudio data viewer.

Now let’s create a tibble from the same dataset. You can create a tibble from existing data with the as_tibble() function. Indicate what data you’d like to use in the parentheses of the function. In this case, you will put the word “diamonds."

as_tibble(diamonds)
Results

When you run the function, you get a tibble of the diamonds dataset. 
screenshot of a tibble of the same diamonds dataset 

While RStudio’s built-in data frame tool returns thousands of rows in the diamonds dataset, the tibble only returns the first 10 rows in a neatly organized table. That makes it easier to view and print. 
Additional resources 

For more information on tibbles, check out the following resources: 

    The entry for Tibble in the tidyverse documentation summarizes what a tibble is and how it works in R code. If you want a quick overview of the essentials, this is the place to go. 

    The Tidy chapter in "A Tidyverse Cookbook" is a great resource if you want to learn more about how to work with tibbles using R code. The chapter explores a variety of R functions that can help you create and transform tibbles to organize and tidy your data. 