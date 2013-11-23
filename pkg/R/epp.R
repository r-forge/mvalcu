
setClass("epp", representation(
	breedingDat     = "SpatialPointsBreeding", 
	polygonsDat    	= "SpatialPolygonsDataFrame", 
	eppPairs      	= "data.frame", 
	rank 			= "numeric", 
	EPP				= "data.frame"
	),
	
	validity = function(object)	{
		if (object@rank < 1)
			stop("rank must be greater than 0.")	
	if(! identical(polygonsDat@data[, 1], breedingDat@id))
    stop( dQuote("polygonsDat@data[, 1]"), " does not match ",  dQuote("breedingDat@id") )
      
		return(TRUE)
		}
 )


epp <- function(breedingDat, polygonsDat = DirichletPolygons(breedingDat), eppPairs, rank = 3) { 

    
	  #bricks
		nb  = poly2nb(polygonsDat)
		hnb = higherNeighborsDataFrame(nb, maxlag = rank)
		b   = data.frame(breedingDat@data, id = breedingDat@id, male = breedingDat@male, female = breedingDat@female)
    
    # build up epp set
    d = merge(hnb, b, by = "id") 
    d = merge(d, b, by.x = 'id_neigh', by.y = 'id',  all.x = TRUE, suffixes= c("_S","_N") )
	  d$k_S = NULL; d$k_N = NULL
    d$z = paste(d$male_S, d$female_N)    

    e = data.frame(z = paste(eppPairs$male, eppPairs$female), epp = 1)


    d = merge(d, e, by = "z", all.x = TRUE)
    d$z = NULL
    d[is.na(d$epp), "epp"] = 0
    
    # fix names
    names(d) [which(names(d) == "male_S")] = "male"
    names(d) [which(names(d) == "female_N")] = "female"
    d$male_N = NULL; d$female_S = NULL    
    d = d[, union(c("id_neigh", "id", "rank", "male", "female", "epp"), names(d)) ]
    

    # new
		new("epp", breedingDat = breedingDat, polygonsDat = polygonsDat, eppPairs = eppPairs, rank = rank, EPP = d)
    
    
    
    
	}


	
	

	
	
	
	
	





	
	
	
	
	
	
	




















