# R.version
# _                                
# platform       x86_64-w64-mingw32               
# arch           x86_64                           
# os             mingw32                          
# crt            ucrt                             
# system         x86_64, mingw32                  
# status                                          
# major          4                                
# minor          4.1                              
# year           2024                             
# month          06                               
# day            14                               
# svn rev        86737                            
# language       R                                
# version.string R version 4.4.1 (2024-06-14 ucrt)
# nickname       Race for Your Life 


library(ape)
library(ggtree)
# packageVersion("ape")
# [1] ‘5.8’
# packageVersion("ggtree")
# [1] ‘3.12.0’


setwd("D:/Desktop/03_plot")

# Read the tree from the Newick file
tree <- read.tree("Saxifragales.tre")  

# Plot the tree in a circular layout
p <- ggtree(tree, layout = "circular", size = 4, branch.length = "none") + 
  geom_tiplab(size = 20, hjust=-0.3) +  # Adjust tip label size
  # geom_text2(aes(label=node), hjust=-0.5, size=4) +  # Print node labels
  theme_tree2() +
  
  # theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +  # Control margins around the tree
  # geom_hilight(node=17, fill="blue", alpha=0.5) +
  # geom_hilight(node=18, fill="lightblue", alpha=0.5) +  
  # geom_hilight(node=21, fill="lightgreen", alpha=0.5) +  
  # geom_hilight(node=25, fill="yellow", alpha=0.5)  
  
  
  # first
  # label="Saxifragaceae alliance"
  geom_cladelabel(node=18, label="", align=TRUE, offset=2, barsize=40, fontsize=30, color="#ADC0E8") +
  # label="Haloragaceae s.l."
  geom_cladelabel(node=21, label="", align=TRUE, offset=2, barsize=40, fontsize=30, color="#F0BAC6") +
  # label="Woody clade"
  geom_cladelabel(node=25, label="", align=TRUE, offset=2, barsize=40, fontsize=30, color="#F8CDAC") +

  # second
  # label="Haloragaceae / Crassulaceae clade"
  geom_cladelabel(node=20, label="", align=TRUE, offset=2.9, barsize=40, fontsize=30, color="#FFE4E2") +
  
  # third
  # label="Core Saxifragles"
  geom_cladelabel(node=17, label="", align=TRUE, offset=3.8, barsize=40, fontsize=30, color="#DFE2FF") 

ggsave("circular.png", plot=p, width=40, height=40, units="in", limitsize = FALSE, bg = "transparent")
