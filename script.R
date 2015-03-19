#Test a file
#data=read.csv("./specdata/025.csv")

dir = "./specdata/"

pollutantmean <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
	for (i in id) {
		#print(i)
		nomFic = paste(idToFile(i), ".csv", sep="")
		print(nomFic)
		chemFic = paste(directory, nomFic, sep="")
		read.csv(chemFic)	
	
	}
}

idToFile <- function(id){
	if (id < 10){
		result = paste("00", toString(id), sep="")
	}
	
	else if (id < 100){
		result = paste("0", toString(id), sep="")	
	}

	else {
		result = toString(id)
	}
	
}

pollutantmean(dir)
