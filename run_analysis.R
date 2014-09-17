## First we need to input the two datasets we need to generate.
testRAW <- read.table("X_test.txt")
trainRAW <- read.table("X_train.txt")

## Combine them into one giant dataset.
allRAW <- rbind(testRAW,trainRAW)

## Notice that we need to substract the mean & sd of each signal(about 561 sinals). 
## From the "features.txt" we can see that for every signal, it has many variables.
## It's not hard to tell the pattern: for a mean or sd variable, it must contains
## the key word "-mean" or "-std". So we can use agrep() to locate them.

## Input the variables names file, and substract the name vector.
varName <- read.table("features.txt")
varNAME <- as.character(varName$V2)

## And we can locate them by keywords. We name the location vector M_S_Vector.
M_S_Vector <- agrep("-mean",varNAME)
M_S_Vector <- c(M_S_Vector,agrep("-std",varNAME))

## So we can apply it to the giant dataset above.
allSUB <- allRAW[,M_S_Vector]

## Oh, maybe we shouldn't forget the original names for each variable. We still
## need to deal with them later. Let's add it to the subset.
ORInames <- varNAME[M_S_Vector]
names(allSUB) <- ORInames

## One thing I just recall: Note that these 2 steps also returns the variables 
## of "-meanFreq", which I think should be ruled out.
cutout <- agrep("-meanFreq",ORInames)
allSUB <- allSUB[,-cutout]

## And now we should add 2 columns of the activity names, as well as the subjects who 
## conduct the experiments, for each observation. 
## Input the y_test.txt and y_train.txt, merge it into a long vector for the combined dataset 
## of "testRAW" and "trainRAW". Don't get the order wrong. 
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")
ylong <- rbind(ytest,ytrain)

## Replace the "1,2..." with actual activity names, refering to the activity_lebels.txt.
ylong <- gsub(1, "WALKING",ylong)
ylong <- gsub(2, "WALKING_UPSTAIRS",ylong)
ylong <- gsub(3, "WALKING_DOWNSTAIRS",ylong)
ylong <- gsub(4, "SITTING",ylong)
ylong <- gsub(5, "STANDING",ylong)
ylong <- gsub(6, "LAYING",ylong)

## Add it to the allSUB dataset. 
## Since ylong is actually a data.frame, I use a [,1] here to make sure only a vector
## is passed to the allSUB.
allSUB$Activity_Label <- ylong[,1]

## The same for the subject column.
subjtest <- read.table("subject_test.txt")
subjtrain <- read.table("subject_train.txt")
subject_id <- rbind(subjtest,subjtrain)

allSUB$Subject_id <- subject_id[,1]

## Make it a "factor" column.
allSUB$Subject_id <- as.factor(allSUB$Subject_id)

## So now we have finished step 1, 2, 3, & 4.

## Now in step 5, we need to calculate mean of every measurement for 
## every subject doing each activity. It may be easier if we generate a
## new column as an INDEX for later use.
namesub<- paste("sub",allSUB$Subject_id,sep="")
sub_act <- paste(namesub, allSUB$Activity_Label)
allSUB$sub_act <- sub_act

## Let's use a loop to calculate all the variables (from column 1 to 66).
lalala <- as.data.frame(tapply(allSUB[,1],allSUB$sub_act,mean))

i=1
for (i in i:66){
    lala <- as.data.frame(tapply(allSUB[,(i+1)],allSUB$sub_act,mean))
    lalala <- cbind(lalala.lala)
}

## Rename the new dataset "lalala", according to the original name of allSUB.
names(lalala)<- names(allSUB)[1:66]
str(lalala)

## So now we've generated a new dataset as the step 5 ask us to. It contains both
## column-names (different measurements) and row-names (different subject 
## doing defferent activity). 

## But since the guidence require us not to contain any rownames. So We need to 
## create a column to serve as the rownames. I name it "category".
lalala$category <- rownames(lalala)

## Reorder it.
lalala <- lalala[.c(67,1:66)]

## Let's output the file.
write.table(lalala,file="new_data_Longda.txt",sep=",",quote=FALSE,row.names=FALSE)








