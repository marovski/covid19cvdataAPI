source("data.R")
# get covid19 data endpoint --------------------------------

#* Cabo Verde COVID-19 Cases
#* @serializer unboxedJSON
#* @param dataset_number:int If provided, filter by: 1.Total;2.Cities;3.Demographics 
#* @get /covid19cv/
function(res, dataset_number) {
  
  if(res$status==400)
  {
    list(error=jsonlite::unbox("Bad Request"))
  }
  
  if(missing(dataset_number)){
    
    modified <- list(keys = colnames(covid19cvdata::covid19cv),
                     values = unname(alply(covid19cvdata::covid19cv, 1, identity)),status=200)
    
  }else if(dataset_number==1){
      modified <- list(keys = colnames(covid19cvdata::covid19cv_nacional),
                       values = unname(alply(covid19cvdata::covid19cv_nacional, 1, identity)),status=200)
      
    }
    else if (dataset_number==2) {
      modified <- list(keys = colnames(covid19cvdata::covid19cv_cidades),
                       values = unname(alply(covid19cvdata::covid19cv_cidades, 1, identity)),status=200)
      
    }
    else if (dataset_number==3) {
      modified <- list(keys = colnames(covid19cvdata::covid19cv_pop),
                       values = unname(alply(covid19cvdata::covid19cv_pop, 1, identity)),status=200)
    
    
    }else{
      
      msg <- "Your request did not include a correct parameter."
      res$status <- 400 # Bad request
      list(error=jsonlite::unbox(msg))
    }

  
  
}


