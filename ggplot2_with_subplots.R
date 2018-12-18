library(ggplot2)
library(dplyr)
cocoa <- read.csv("flavors_of_cocao_clean.csv")
colnames(cocoa) <- c("bean.bar.orgin", "ref","date" , "percent", "location","rating", "beantype" ,"origin", "company")

#install.packages("devtools")
#library(devtools)
#install_github("https://github.com/kassambara/easyGgplot2")
library(easyGgplot2)
cocoa$percent_num <- as.numeric(sub("%", "", as.character(cocoa$percent)))
p1 <- ggplot(data = cocoa, aes(x = percent_num)) + 
  geom_histogram(breaks=seq(40, 100, by=2), 
                 col="#5b3d22", 
                 fill="#54381f",
                 alpha = .6) + 
  labs(title="Histogram for Cocoa Percent", x="Cocoa Percent %", y="Count") + 
  xlim(c(38,102)) +
  theme(plot.title = element_text(hjust = 0.5))
p2 <- ggplot(data = cocoa, aes(x = rating)) + 
  geom_histogram(breaks=seq(0.0, 5.0, by=0.25), 
                 col="#5b3d22", 
                 fill="#54381f",
                 alpha = .6) + 
  labs(title="Histogram for Ratings", x="Ratings", y="Count") + 
  xlim(c(0.0,5.0)) +
  theme(plot.title = element_text(hjust = 0.5))
ggplot2.multiplot(p1, p2, cols = 2)
ggsave("cocoa_percent_rating_dist.png", dpi = 600, width = 6, height = 3)
```
```{r}
cocoa$percent_num <- as.numeric(sub("%", "", as.character(cocoa$percent)))
p1 <- ggplot(data = cocoa) + 
  geom_histogram(aes(x = percent_num), breaks=seq(40, 100, by=2), 
                 col="#5b3d22", 
                 fill="#54381f",
                 alpha = .6) + 
  labs(title="Histogram for Cocoa Percent", x="Cocoa Percent %", y="Count") + 
  xlim(c(38,102)) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_histogram(aes(x = rating), breaks=seq(3.0, 4.5, by=0.15), 
                 col="#5b3d22", 
                 fill="#54381f",
                 alpha = .6) + 
  facet_wrap(~ BinTrust, ncol=2) +
  labs(title="Histogram for Cocoa Percent", x="Cocoa Percent %", y="Count") + 
  xlim(c(3.0,4.5)) +
  theme(plot.title = element_text(hjust = 0.5))