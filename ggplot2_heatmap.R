library(ggplot2)
library(dplyr)
cocoa <- read.csv("flavors_of_cocao_clean.csv")
colnames(cocoa) <- c("bean.bar.orgin", "ref","date" , "percent", "location","rating", "beantype" ,"origin", "company")

orig <- group_by(cocoa, origin , location)
orig1 <- summarise(orig,  count=n() ,rate4= mean(rating))
orig2<- filter(orig1, count>=15)

ggplot(orig2, aes(origin, location, fill=rate4))+
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(angle = 90, hjust = 1))+
  geom_tile(color = "white")+
  scale_fill_gradient(low="#c6b2a1", high="#4c2300") +
  labs(x="Broad Bean Origin", y="Country" , 
       title="Chocolate Bar Rating Heatmap", fill="Rating")
ggsave("heat_map.png", dpi = 600, width = 5, height = 3)