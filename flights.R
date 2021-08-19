# 1
install.packages('igraph')
library(igraph)
connectingroutes <- read.csv('C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\connecting_routes.csv',header = FALSE)
colnames(connectingroutes) <- c('Flights','ID','Main Airport','Airport ID','Destination','Dest ID','Halts','Machinary','NA')
head(connectingroutes)
halts <- read.csv('C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\flight_hault.csv')
colnames(halts) <- c('ID','Name','City','Country','IATA_FAA','ICAO','Latitude','Longitude','Altidude','Time','DST','Tz Database time')
head(halts)
# Finding degree Centrality, degree of closeness centrality and degree of in-between centrality for 'Connecting_routes' data set
routesnw <- graph.edgelist(as.matrix(connectingroutes[1:300,c(3,5)]),directed = TRUE)  # We will randomly take some data since there is large data and R will crash 
plot(routesnw)
# Calculating number of airports in the network
vcount(routesnw)
# Calculating number of connections in the network
ecount(routesnw)
# Finding the airport that has most flights coming and how many
indegree <- degree(routesnw,mode = 'in')
max(indegree)
index <- which(indegree == max(indegree))
indegree[index]
which(halts$IATA_FAA == "ATL")
halts[3584, ]
# Finding the airport that has most flights going out and how many
outdegree <- degree(routesnw,mode = 'out')
max(outdegree)
index <- which(outdegree == max(outdegree))
outdegree[index]
which(halts$IATA_FAA == "ATL")
halts[3584, ]
# Which airport is close to most of the airports (in terms of number of flights)
closenessin <- closeness(routesnw, mode = "in", normalized = TRUE)
max(closenessin)
index <- which(closenessin == max(closenessin))
closenessin[index]
which(halts$IATA_FAA == "FRA")
halts[338, ]
# Which airport comes in between most of the routes and hence is an important international hub?
btwn <- betweenness(routesnw, normalized = TRUE)
max(btwn)
index <- which(btwn == max(btwn))
btwn[index]
which(halts$IATA_FAA == "LAX")
halts[3386,]
# Degree, closeness, and betweenness centralities together
centralities <- cbind(indegree, outdegree, closenessin, btwn)
colnames(centralities) <- c("inDegree","outDegree","closenessIn","betweenness")
head(centralities)
# correlations of the centralities
cor(centralities)
# Any pair with low correlation?
plot(centralities[, "closenessIn"], centralities[, "betweenness"])
subset(centralities, (centralities[,"closenessIn"] > 0.015) & (centralities[,"betweenness"] > 0.06))
halts[which(halts$IATA_FAA == "LAX"), ]
halts[which(halts$IATA_FAA == "CDG"), ]
halts[which(halts$IATA_FAA == "ANC"), ]
subset(centralities, (centralities[, "closenessIn"] < 0.005) & (centralities[, "betweenness"] < 0.02))
# Which is one of the most important airport in the world (the Google way)?
eigenv <- eigen_centrality(routesnw, directed = TRUE, scale = FALSE, weights = NULL)
eigenv$vector
max(eigenv$vector)
index <- which(eigenv$vector == max(eigenv$vector))
eigenv$vector[index]
which(halts$IATA_FAA == "ATL")
halts[3584, ]
pgrank <- page_rank(routesnw, damping = 0.999) # do not put damping=1; the solution not necessarily converges; put a value close to 1.
pgrank$vector
max(pgrank$vector)
index <- which(pgrank$vector == max(pgrank$vector))
pgrank$vector[index]
which(routesnw$IATA_FAA == "ATL")
halts[3584, ]

