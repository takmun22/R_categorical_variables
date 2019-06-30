#Load in the required pacages
library(data.table)
library(caret)



likelihood_encoder <- function(dataset,response_variable,categorical_variable,number_of_folds){

    #Dataset has to be data.table
    dataset <- as.data.table(dataset)
    
    #Split split the data into folds
    folds <- createFolds(as.matrix(dataset[,dim(dataset)[2]]), k = number_of_folds, list = FALSE)
                         
    #Make a copy of the dataset
    copy_dataset = copy(dataset)
                         
    #Make a column with the folds
    copy_dataset$fold <- folds
                         
    ##Make a list of the fold numbers for us to loop through later.
    portions = seq(1,number_of_folds, by =1)
    
    #Little trick, rename the column to var and then we'll change back later on.
    setnames(copy_dataset, old = c(categorical_variable,response_variable), new= c("var","TARGET"))
                         
    
    
    #Loop through each fold and execute.
    for (portion in portions){
        
        #Select portion of the data
        data = copy_dataset[fold==portion]

        #Calculate the average for that particular fold
        averages <- data[,mean(TARGET), by=var]

        #Set the key
        setkey(averages,var)

        #Newdata
        new_data <- as.vector(averages[data[,var]])$V1

        #Apply the averages the dataset
        copy_dataset[fold==portion, var:=new_data]
 
    }
    #Change our transformed categorical variable to a numeric type                     
    copy_dataset[,var:=as.numeric(var)]
    
    copy_dataset$fold <- NULL
    
    #Return the the new variable in its encoded form
    return(copy_dataset$var)
                      
}
