
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
	b = data.frame(id = 1:5, x = rnorm(5), y = rnorm(5), male = paste0("m",1:5), female =  paste0("f",1:5), xx = rnorm(5), stringsAsFactors=FALSE  )  
    breedingDat = SpatialPointsBreeding(b )
    polygonsDat = DirichletPolygons(breedingDat)
    eppPairs = data.frame(male = c("m1", "m1", "m3", "m5"), female=c("f2", "f3", "f5", "f3") )
    
    plot(polygonsDat)
    plot(breedingDat, add = T)
    
	#bricks
		nb  = poly2nb(polygonsDat)
		hnb = higherNeighborsDataFrame(nb, maxlag = rank)
		b   = data.frame(breedingDat@data, id = breedingDat@id, male = breedingDat@male, female = breedingDat@female)
    
  # build up epp set
    d = merge(hnb, b, by = "id")
    d = merge(d, b, by.x = 'id_neigh', by.y = 'id',  all.x = TRUE, sort = FALSE, suffixes= c("","_neigh") )
	
    e = eppPairs
    e$z = paste(e$male, e$female)
    e$epp = 1; e$male = NULL; e$female = NULL
    
	d$z = paste(d$male, d$female_neigh)
    d = merge(d, e, by = "z", all.x = TRUE)
    d$z = NULL
	d$epp = as.numeric(!is.na(d$epp))
	d$k = NULL
	d$k_neigh = NULL
	
	d[d$epp == 1, ]
    
    
    
    
	}
	
	

	
	
	
	
	





	
	
	
	
	
	
	




















