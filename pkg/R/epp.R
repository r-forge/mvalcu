


setClass("epp", representation(
	breedingDat     = "SpatialPointsBreeding", 
	polygonsDat    	= "SpatialPolygonsDataFrame", 
	eppDat         	= "data.frame", # TODO should exdend data.frame
	rank 			= "numeric"
	),
	
	validity = function(object)	{
		if (object@rank < 1)
			stop("rank must be greater than 0.")	
		return(TRUE)
		}
 )


#spatial epp setting
sepp <- function(breedingDat, polygonsDat, eppDat, rank = 3) { 

	new("epp", breedingDat = breedingDat, polygonsDat = DirichletPolygons(breedingDat), eppDat = eppDat, rank = rank)

	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
eppData <- function(eppdat) { 
	#TODO
	d = higherNeighborsDataFrame(nb, maxlag = n_neighborhoods)
	nb = poly2nb(v)

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
	
	
	
	
	
	
	




















