library(rvest)
library(tidyverse)

url = 'https://en.wikipedia.org/wiki/World_population'

html_content = read_html(url)

tables = html_table(html_content, fill = TRUE)

df = tables[[5]]
view(df)
#make languages chart

df %>%
  ggplot() + geom_col(aes(x = Country,y =  parse_number(Population)))