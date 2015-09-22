library(magrittr)
library(dplyr)
library(tidyr)

options(digits = 3)
# read data
prostate <- read.table("prostate.txt", sep = "", header = T)
# training set
train.prostate <- prostate %>% filter(train == TRUE) %>% select(-train)
test.prostate <- prostate %>% filter(train == FALSE) %>% select(-train)
# correlations of predictors 
cor.mat <- train.rostate %>% select(-lpsa) %>% cor(.)
upperTriangle(cor.mat, diag = T) <- NA
cor.mat
# Linear model fit 
center <- train.prostate %>% select(., -lpsa) %>% scale(.) %>% as.data.frame() %>%
  mutate(., lpsa = train.prostate$lpsa)
fit1 <- lm(data = center, formula = lpsa ~.)

# all possible combination
preds <- train.prostate %>% select(-lpsa) %>% colnames()
for (k in 1:length(preds)) {
  RSS <- c()
  combs <- combn(preds, k)
  
}

