import pandas as pd
import numpy as np
import networkx as nx 
import matplotlib.pyplot as plt
# Calculating for 'Connecting_routes'
G = pd.read_csv("C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\connecting_routes.csv")
G.columns = ['Flights','ID','Main airport','Main Airport ID','Destination','Destination ID','Halts','Machinary','NA']
G = G.iloc[:, 0:10]
g = nx.Graph()
g = nx.from_pandas_edgelist(G, source = 'Main airport', target = 'Destination')
print(nx.info(g))
b = nx.degree_centrality(g)  # Degree Centrality
print(b) 
pos = nx.spring_layout(g, k = 0.15)
nx.draw_networkx(g, pos, node_size = 25, node_color = 'blue')
# closeness centrality
closeness = nx.closeness_centrality(g)
print(closeness)
## Betweeness Centrality 
b = nx.betweenness_centrality(g) # Betweeness_Centrality
print(b)
## Eigen-Vector Centrality
evg = nx.eigenvector_centrality(g) # Eigen vector centrality
print(evg)
# cluster coefficient
cluster_coeff = nx.clustering(g)
print(cluster_coeff)
# Average clustering
cc = nx.average_clustering(g) 
print(cc)
# Calculating for 'haults'
H = pd.read_csv("C:\\Users\\WIN10\\Desktop\\LEARNING\\DS\\Network Analytics\\flight_hault.csv")
H.columns = ['ID','Name','City','Country','IATA_FAA','ICAO','Latitude','Longitude','Altitude','Time','DST','Tz database time']
H = H.iloc[:, 0:12]
h = nx.Graph()
h = nx.from_pandas_edgelist(H, source = 'City', target = 'IATA_FAA')
print(nx.info(h))
b = nx.degree_centrality(h)  # Degree Centrality
print(b) 
pos = nx.spring_layout(h, k = 0.15)
nx.draw_networkx(h, pos, node_size = 25, node_color = 'blue')
# closeness centrality
closeness = nx.closeness_centrality(h)
print(closeness)
## Betweeness Centrality 
b = nx.betweenness_centrality(h) # Betweeness_Centrality
print(b)
## Eigen-Vector Centrality
evg = nx.eigenvector_centrality(h) # Eigen vector centrality
print(evg)
# cluster coefficient
cluster_coeff = nx.clustering(h)
print(cluster_coeff)
# Average clustering
cc = nx.average_clustering(h) 
print(cc)
