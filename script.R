# Load necessary library
library(adegenet)

# Read data from the specified file
HawksbillAll <- read.table(file = 'Hawksbill.txt', 
                            header = TRUE, 
                            na.strings = "NA", 
                            dec = ".", 
                            strip.white = TRUE)

# Convert data frame to genind object
HawksAdeTot <- df2genind(HawksbillAll, 
                         sep = NULL, 
                         ncode = 3, 
                         ind.names = NULL, 
                         loc.names = NULL, 
                         pop = NULL, 
                         NA.char = "NA", 
                         ploidy = 2, 
                         type = "codom", 
                         strata = NULL, 
                         hierarchy = NULL)

# Perform clustering analysis
grp <- find.clusters(HawksAdeTot, max.n.clust = 10)

# Conduct Discriminant Analysis of Principal Components (DAPC)
dapc1 <- dapc(HawksAdeTot, grp$grp, n.pca = NULL, n.da = NULL, var.contrib = TRUE, scale = FALSE)

# Visualize results
compoplot(dapc1)
scatter(dapc1)
myCol <- c("turquoise", "limegreen", "blue", "orange", "red")
scatter(dapc1, posi.da = "bottomright", bg = "white", col = myCol, scree.pca = TRUE, posi.pca = "bottomleft")

# Summarize DAPC results
summary(dapc1)

# Prepare output data frames
tabIscapTot <- data.frame(Cluster = grp$grp,
                           Proportion_assign_cluster = dapc1$posterior,
                           geno = HawksbillAll)

# Write results to text files
write.table(tabIscapTot, "IscapTotDAPCResK8.txt", col.names = TRUE, sep = "\t", dec = ".")
write.table(dapc1$ind.coord, "CoordDAPC.txt", sep = "\t")
write.table(dapc1$means, "GroupMeansDAPC.txt", sep = "\t")
write.table(dapc1$grp.coord, "GroupCoordDAPC.txt", sep = "\t")
