library(networkD3)
edgelist <- read.csv('edgelist.csv')
nodelist <- read.csv('nodelist.csv')
forceNetwork(Links = edgelist, 
             Nodes = nodelist,
             Source = "SourceID", 
             Target = "TargetID",
             Value = "Weight", 
             NodeID = "NodeName",
             opacity = 0.8,
             Nodesize="NodeSize",
             legend = TRUE,
             Group = "Group",
             colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
             fontSize = 18,
             fontFamily = "serif", 
             linkDistance = 300
) %>%
  saveNetwork(file = 'networkD3.html')