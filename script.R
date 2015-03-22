#Test a file
#data=read.csv("./specdata/275.csv")
#print(data)

dir = "./specdata/"
id = 1:332


###################################################################
###################################################################
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used

  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  pol_vec = vector(mode = "numeric", length(id))
  
  for (i in id) {
    
	  nomFic = paste(idToFile(i), ".csv", sep="")
	  chemFic = paste(directory, nomFic, sep="")
    
	  data = read.csv(chemFic)	

    if (pollutant == "n"){
      pol_data = data$nitrate
    }
    
    else if (pollutant == "f"){
      pol_data = data$sulfate
    }
    
    pol_vec[i] = mean(pol_data, na.rm = TRUE)
  }

  mean(pol_vec, na.rm = TRUE)
}
###################################################################
###################################################################



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

pol = pollutantmean(dir, "n", id)
print(pol)