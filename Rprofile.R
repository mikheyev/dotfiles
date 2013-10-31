# .Rprofile 



## ggplot themes
my_theme <- function(base_size = 12, base_family = "") { 
  # Start with theme_bw and then modify some parts 
  theme_bw(base_size = base_size, base_family = base_family) %+replace% 
    theme( 
        axis.title.x = element_text(colour="grey20",size=20,face="bold"),
        axis.title.y = element_text(colour="grey20",size=20,face="bold",angle = 90)
    ) 
} 
