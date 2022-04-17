

download.file("https://tagis.dep.wv.gov/arcgis/rest/services/WVDEP_enterprise/mining_reclamation/MapServer/0/query?where=1%3D1&outFields=*&geometry=&geometryType=esriGeometryEnvelope&inSR=4326&spatialRel=esriSpatialRelIntersects&outSR=4326&f=json", destfile = "data/wv.shp")

wv_mining_locations <- st_read("data/wv.shp")



wv_mining_