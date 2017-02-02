# Learning Analytics im Rahmen von e:t:p:M/ L^2

# Pakete laden
pacman::p_load(TimeSpaceAnalysis, XML)

# Repository laden
source("repository.R")

# Piwik Auth Token laden 
source("auth_token.R")


# Dateien heruntrladen
download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?module=API&method=UserId.getUsers&format=CSV&idSite=1&period=range&date=2016-10-21,2017-01-30&expanded=1&translateColumnNames=1&language=de&segment=pageTitle%3D%3De%253At%253Ap%253AM%25C2%25AE%2520%25E2%2580%2593%2520Zahldarstellungen%2520und%2520Stellenwertsysteme,pageTitle%3D%3De%253At%253Ap%253AM%25C2%25AE%2520%25E2%2580%2593%2520Multiplikation%2520und%2520Division&filter_limit=-1&token_auth=", auth_token), "visitors.csv" )
# Muss durch externes programm konvertiert werden.
# @TODO Problem beheben.
benutzer_mathe <- read_csv2("visitors_math.csv")
benutzer_id <- benutzer_mathe$`Metadaten: idvisitor`

benutzer_id %>%
  map(function(id) download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?date=2016-10-01,2017-01-30&period=range&module=API&method=Live.getVisitorProfile&visitorId=", id, "&idSite=1&format=XML&limitVisits=1000&token_auth=", auth_token), paste0("benutzer_", id,".xml") )  )

# XML Dateien importieren 
# @INFO Achtung, sehr zeitintensiv!
benutzer <- paste0("benutzer_", benutzer_id, ".xml") %>% 
  map(function(name) xmlToList(xmlParse( name )) )

# Fake Nutzer
benutzer <- benutzer[-19]

# In Repository speichern
rmFromLocalRepo(names(asearch("name:benutzer")), removeData = TRUE, removeMiniature = TRUE)
asave(benutzer, archiveSessionInfo = FALSE)
