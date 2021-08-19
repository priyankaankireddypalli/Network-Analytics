library(igraph)
#  Circula Network for facebook data set
circular <- read.csv("C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\facebook.csv", header=TRUE)
head(circular) 
# shows initial few rows of the loaded file
# create a newtwork using adjacency matrix
CircularNW <- graph.adjacency(as.matrix(circular), mode="undirected", weighted=TRUE)
plot(CircularNW)
# Star Network forInstagram 
# Load the adjacency matrix from the csv file
star <- read.csv("C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\instagram.csv", header = TRUE)
head(star) 
# create a newtwork using adjacency matrix
# help file for the api graph.adjacency
starNW <- graph.adjacency(as.matrix(star), mode = "undirected")
plot(starNW)
# Star Network forLinkedin 
# Load the adjacency matrix from the csv file
ano_star <- read.csv("C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\linkedin.csv", header = TRUE)
head(ano_star) 
# create a newtwork using adjacency matrix
# help file for the api graph.adjacency
ano_starNW <- graph.adjacency(as.matrix(star), mode = "undirected")
plot(ano_starNW)