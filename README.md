Hawksbill Turtle Genetic Analysis:
This R script performs a genetic analysis of Hawksbill turtles using the adegenet package. The analysis includes data reading, clustering, and visualization through Discriminant Analysis of Principal Components (DAPC).
Key Features
Data Import: Reads genetic data from a specified text file, handling missing values and formatting issues.
Genetic Data Conversion: Converts the imported data frame into a genind object suitable for genetic analysis.
Clustering: Identifies genetic clusters within the data using the find.clusters function, allowing for up to 10 clusters.
DAPC Analysis: Conducts DAPC to explore the structure of genetic variation and visualize groupings.
Visualization: Generates visual representations of the DAPC results, including component plots and scatter plots with customized colors.
Output Generation: Exports key results, including cluster assignments, individual coordinates, group means, and group coordinates to text files for further analysis.
