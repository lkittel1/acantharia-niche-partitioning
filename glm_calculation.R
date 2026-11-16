balances <- read.table("/Users/lkp/Downloads/factor_balances.csv", 
                       header=TRUE, sep="\t")
meta     <- read.table("/Users/lkp/Downloads/depth.txt", 
                       header=TRUE, sep="\t")

df <- merge(balances, meta, by.x="Sample", by.y="sequence")

# compute squared term on the fly
df$NominalDepth2 <- df$NominalDepth^2

results <- data.frame()
for (i in 1:5) {
  col <- paste0("Factor_", i)
  fit <- lm(df[[col]] ~ df$NominalDepth + df$NominalDepth2)
  results <- rbind(results, data.frame(
    factor        = i,
    intercept     = coef(fit)[1],
    NominalDepth  = coef(fit)[2],
    NominalDepth2 = coef(fit)[3]
  ))
}

print(results)
write.csv(results, "/Users/lkp/Downloads/factor_glm_coefficients.csv", row.names=FALSE)