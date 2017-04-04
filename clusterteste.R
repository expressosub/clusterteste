# cluster teste
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

function (X, AccountCount, AvgOrderSize, CustomerCnt, Row, clusterGroup)
{
  data = data.frame(X = X, AccountCount = AccountCount, AvgOrderSize = AvgOrderSize, CustomerCnt =
                      CustomerCnt, Row = Row)
  cleanData <- subset(data, select = -c(X))
  fit <- kmeans(cleanData, clusterGroup)
  aggregate(cleanData, by = list(fit$cluster), FUN = mean)
  cleanData <- data.frame(cleanData, fit$cluster)
  cleanData <- subset(cleanData, select = c(Row, fit.cluster))
  cleanData <- merge(x = data, y = cleanData, by = "Row", all.x = TRUE)
  cleanData <- subset(cleanData, select = -c(Row))
  return(cleanData)
}
