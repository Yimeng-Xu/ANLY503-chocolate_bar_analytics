library(ggplot2)
library(dplyr)
cocoa <- read.csv("flavors_of_cocao_clean.csv")
colnames(cocoa) <- c("bean.bar.orgin", "ref","date" , "percent", "location","rating", "beantype" ,"origin", "company")

#convert percentage to numerical
cocoa$pct <- as.numeric(gsub("\\%", "", cocoa$percent))

#scattor plot
ggplot(cocoa,aes(x=pct, y=rating)) +
  geom_point(color = '#664021', alpha = 0.5) +
  theme(plot.title = element_text(hjust = 0.5), legend.position="none") +
  xlab("Cocoa Percent(%) ") + ylab("Chocolate Bar Rating") +
  ggtitle("Scattorplot of Cocoa Percent vs Chocolate Bar Rating")

ggsave("cocoa_percent_vs_rating.png", dpi = 600, width = 5, height = 3)