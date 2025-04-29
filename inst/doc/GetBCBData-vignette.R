## ----message=FALSE------------------------------------------------------------
library(GetBCBData)
library(dplyr)
library(ggplot2)

my.id <- c(selic = 432)

df.bcb <- gbcbd_get_series(id = my.id ,
                       first.date = '2000-01-01',
                       last.date = Sys.Date(),
                       format.data = 'long',
                       use.memoise = TRUE, 
                       cache.path = tempdir(), # use tempdir for cache folder
                       do.parallel = FALSE)

glimpse(df.bcb)

p <- ggplot(df.bcb, aes(x = ref.date, y = value/100) ) +
  geom_line() + 
  labs(title = 'Selic Rate', 
       subtitle = paste0(min(df.bcb$ref.date), ' to ', max(df.bcb$ref.date)),
       x = '', y = 'Interest Rate') + 
  theme_light()
  
print(p)


