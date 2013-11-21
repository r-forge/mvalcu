


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
    eppPairs = data.frame(male = c("e", "a", "b", "b"), female=c("C", "C", "A", "D") )
    
    plot(polygonsDat)
    plot(breedingDat, add = T)
    
	#bricks
		nb  = poly2nb(polygonsDat)
		hnb = higherNeighborsDataFrame(nb, maxlag = rank)
		b   = data.frame(k = breedingDat@data, id = breedingDat@id, male = breedingDat@male, female = breedingDat@female)
	  
      
    
  # build up epp set
    d = merge(hnb, b, by = "id")
    d = merge(d, b, by.x = 'id_neigh', by.y = 'id',  all.x = TRUE, sort = FALSE, suffixes= c("","_neigh") )
		
    # male-female
    e = eppPairs
    e$z = paste(e$male, e$female)
    e$epp_mf = 1; e$male = NULL; e$female = NULL
    d$z = paste(d$male, d$female_neigh)
    d = merge(d, e, by = "z", all.x = TRUE)
    d$z = NULL
    # female-male
    e = eppPairs
    e$z = paste(e$female, e$male)
    e$epp_fm = 1; e$male = NULL; e$female = NULL
    d$z = paste(d$female, d$male_neigh)
    d = merge(d, e, by = "z", all.x = TRUE)
    d$z = NULL
		d$epp = apply(d[, c("epp_mf", "epp_fm")], 1, sum, na.rm = TRUE)
    d$epp_mf = NULL; d$epp_fm = NULL

    
    
    
    
	}
	
	

	
	
	
	
	





	
	
	
	
	
	
	




















