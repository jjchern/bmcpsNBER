
get_bmcps = function(month, year){
        
        if (nchar(year) == 4){
                yr = substr(as.character(year), 3, 4)
        }
        
        if (is.numeric(month)){
                mon = tolower(month.abb[month])
        } 
        
        fil = paste0(mon, yr, "pub")
        fil.zip = paste0(fil, ".zip")
        url = paste0("http://www.nber.org/cps-basic/", fil.zip)
        
        download.file(url, fil.zip, quiet = TRUE)
        unzip(fil.zip)
        unlink(fil.zip)
        
        m = paste0("Done! Basic Monthly CPS ", month.abb[month], " ", as.character(year), " is downloaded.")
        message(m)
}


# Example -----------------------------------------------------------------

# Download Jan, 2016
get_bmcps(1, 2016)

# Download all the data in 2015
for(mon in 1:12){
        get_bmcps(mon, 2015)
}
