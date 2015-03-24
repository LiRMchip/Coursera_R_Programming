###################################################################
###################################################################
pollutantmean <- function(dirName, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used

  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  #Pollutant vector
  pol_vec = vector(mode = "numeric")
  
  #For each data center
  for (i in id) {
   
    #Construct file pat
    nomFic = paste(idToFile(i), ".csv", sep="")
    chemFic = paste("./", dirName, "/", nomFic, sep="")
		
    #Read data
    data = read.csv(chemFic)	
    
    #select right pollutant
    if (pollutant == "nitrate"){
      pol_data = data$nitrate
    }
    
    else if (pollutant == "sulfate"){
      pol_data = data$sulfate
    }
    
    #bind the data
    pol_vec = c(pol_data, pol_vec)
 
  }

  ##print(pol_vec)
  output = mean(pol_vec, na.rm = TRUE)
  return(output)
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

