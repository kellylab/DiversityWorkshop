##First load the "vegan" package
library("vegan")

#read about the vegan package using help function
help("vegan")


### Interesting applications

##Dissimilarity between two samples. "The function is an alternative to dist adding some ecologically meaningful indices."

help("vegdist")

data(varespec)
vare.dist <- vegdist(varespec, method="bray")
plot(hclust(vare.dist))

vare.dist <- as.matrix(vare.dist)

write.table(vare.dist, file = "varespec.bray-distance.txt", append = FALSE, quote = TRUE, sep = ",",row.names = TRUE, col.names = TRUE)

#Try it with our microbial mats data
micro_mat <- t(read.table("seqs_otus.table.txt", header = TRUE, row.names = 1, sep='\t'))

micro_mat.dist <- vegdist(micro_mat, method="bray")
plot(hclust(micro_mat.dist))


##Richness, Evenness, and Diversity
micro_mat.richness <- specnumber(micro_mat)
barplot(micro_mat.diversity,main = "M.M Richness")

micro_mat.diversity <- diversity(micro_mat, index = "shannon", MARGIN = 1, base = exp(1))
barplot(micro_mat.diversity,main = "M.M Diversity")

micro_mat.evenness <- micro_mat.diversity/log(micro_mat.richness)
barplot(micro_mat.evenness,main = "M.M Evenness")


#Ordination - note that our microbial mats dataset is too small to create very meaningful ordinations, but this is still useful for illustrative purposes
mm.ord <- metaMDS(micro_mat.dist, distance = "bray", k = 2, trymax = 1000)
plot(mm.ord, type = "n")
text(mm.ord,display="sites")
