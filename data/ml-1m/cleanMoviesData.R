# read file
ratings <- read.table("ratings2.dat", sep=":", header=FALSE)

# add header
names(ratings) <- c("UserID", "MovieID", "Rating", "Timestamp")

head(ratings)
# save as temp
data <- ratings

# ordered data
orderData <- data[order(data$UserID, data$Timestamp), ]
## get a sense of data
# plot histgram due to Timestamp 
hist(orderData$Timestamp)
quantile(orderData$Timestamp, probs=c(0.6, 0.8, 1))
hist(orderData$UserID)
table(orderData$UserID, orderData$MovieID) # not get my target, rating as matrix
sum(is.na(orderData$MovieID))
any(is.na(orderData$Rating))
all(orderData$Rating > 0)
colSums(is.na(orderData))
# UserID   MovieID    Rating Timestamp 
#      0         0         0         0 
table(orderData$Rating %in% c(5))

# create a Rating ~ UserID + MovieID matrix
xt <- xtabs(Rating ~ UserID + MovieID, data = orderData)


# split data into 5 fold randomly, without according to Timestamp
## something maybe work better for future test , split according to User/Timestamp .etc
