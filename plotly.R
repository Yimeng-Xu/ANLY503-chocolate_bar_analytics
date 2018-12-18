library(plotly)
cocoa <- read.csv("flavors_of_cocao_clean.csv")
colnames(cocoa) <- c("bean.bar.orgin", "ref","date" , "percent", "location","rating", "beantype" ,"origin", "company")
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#7f7f7f"
)
x <- list(
  title = "Cocoa percent",
  titlefont = f
)
y <- list(
  title = "Average Rating",
  titlefont = f
)

p <- plot_ly(
  data = gdpct1, x = ~pct, y = ~rate2,
  color = '#664021', size = ~count,
  mode = 'markers',
  type = "scatter"
  ) %>%
  layout(xaxis = x, yaxis = y, title = "Rating vs Cocoa Percent")
chart_link = api_create(p, filename="Average Rating vs Cocoa Percent")
chart_link

htmlwidgets::saveWidget(as.widget(p), "avg_rating_vs_cocoa_percent.html")
