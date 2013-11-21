


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

	#bricks
		nb = poly2nb(polygonsDat)
		hnb = higherNeighborsDataFrame(nb, maxlag = rank)
		b = data.frame(k = breedingDat$k, id = breedingDat@id, male = breedingDat@male, female = breedingDat@female)
		e = 
		
		# temp
		new("epp", breedingDat = breedingDat, polygonsDat = polygonsDat , eppPairs = eppPairs, rank = rank, EPP = epp)
		
			# social pair
	x = unique(eppData[eppData$epy == 0, c('id', 'male')])
	e = merge(d, x, by = 'id',  all.x = TRUE, sort = FALSE)
	
	x = unique(eppData[, c('id', 'female')])
	e = merge(e, x, by = 'id',  all.x = TRUE, sort = FALSE)
	
	# neighbours
	x = unique(eppData[eppData$epy == 0, c('id', 'male')])
	e = merge(d, x, by.x = 'id_neigh',by.y = 'id',  all.x = TRUE, sort = FALSE, suffixes="_neigh")
	
	x = unique(eppData[, c('id', 'female')])
	e = merge(e, x, by = 'id_neigh',by.y = 'id',  all.x = TRUE, sort = FALSE,suffixes="_neigh")
	

		
		
	}
	
	

	
	
	
	
	





	
	
	
	
	
	
	




















