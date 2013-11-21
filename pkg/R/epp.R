


#

setClass("epp", representation(
	breedingDat     = "SpatialPointsBreeding", 
	polygonsDat    	= "SpatialPolygonsDataFrame", 
	eppPairs      	= "data.frame", # TODO should extend data.frame
	rank 			= "numeric", 
	EPP				= "data.frame"
	),
	
	validity = function(object)	{
		if (object@rank < 1)
			stop("rank must be greater than 0.")	
		return(TRUE)
		}
 )


epp <- function(breedingDat, polygonsDat = DirichletPolygons(breedingDat), eppPairs, rank = 3) { 

  # example
    set.seed(1310)
    b = data.frame(id = 1:5, x = rnorm(5), y = rnorm(5), male = letters[1:5], female = LETTERS[1:5], stringsAsFactors=FALSE  )  
    breedingDat = SpatialPointsBreeding(b )
    polygonsDat = DirichletPolygons(breedingDat)
    eppPairs = data.frame(male = sample(1:5, 3), female= sample(1:5, 3))
    
    plot(polygonsDat)
    plot(breedingDat, add = T)
    
	#bricks
		nb  = poly2nb(polygonsDat)
		hnb = higherNeighborsDataFrame(nb, maxlag = rank)
		b   = data.frame(k = breedingDat@data, id = breedingDat@id, male = breedingDat@male, female = breedingDat@female)
	
  # build up epp set
    d = merge(hnb, b, by = "id")
    d = merge(d, b, by.x = 'id_neigh', by.y = 'id',  all.x = TRUE, sort = FALSE, suffixes= c("","_neigh") )
		
    
	
		
	}
	
	

	
	
	
	
	





	
	
	
	
	
	
	




















