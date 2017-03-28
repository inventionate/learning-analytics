# Learning Analytics im Rahmen von e:t:p:M/ L^2

# Pakete laden
pacman::p_load(TimeSpaceAnalysis, XML)

# Repository laden
source("repository.R")

# Piwik Auth Token laden 
source("auth_token.R")

# Dateien heruntrladen

## Mathe
# download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?module=API&method=UserId.getUsers&format=CSV&idSite=1&period=range&date=2016-10-21,2017-02-10&expanded=1&translateColumnNames=1&language=de&segment=pageTitle%3D%3De%253At%253Ap%253AM%25C2%25AE%2520%25E2%2580%2593%2520Multiplikation%2520und%2520Division,pageTitle%3D%3De%253At%253Ap%253AM%25C2%25AE%2520%25E2%2580%2593%2520Addition%2520und%2520Subtraktion,pageTitle%3D%3De%253At%253Ap%253AM%25C2%25AE%2520%25E2%2580%2593%2520Zahldarstellungen%2520und%2520Stellenwertsysteme&filter_limit=-1&token_auth=", auth_token), "visitors_math.csv" )

## Alle 2014
## ToDo check how much memory amount for catch ALL data!
download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?module=API&method=Live.getLastVisitsDetails&format=CSV&idSite=1&period=range&date=2014-10-20,2015-02-13&doNotFetchActions=1&countVisitorsToFetch=-1&translateColumnNames=1&language=de&filter_limit=-1&token_auth=", auth_token), "visitors_2014.csv" )


# Muss durch externes programm konvertiert werden.
# @TODO Problem beheben.

## Mathe
benutzer_mathe <- read_csv2("visitors_math.csv")
benutzer_id <- benutzer_mathe$`Metadaten: idvisitor`

## Alle 2014
benutzer <- read_csv2("visitors_2014.csv")

benutzer_data <- benutzer %>% select(
  visitorId, 
  userId, 
  visitorType, 
  events, 
  actions, 
  visitDuration) %>%
  filter( !is.na(userId) )
  
benutzer_id <- benutzer_data %>% select(visitorId, userId) %>% distinct %>% .$visitorId

# Interaktionsprofile abfragen

## Mathe
benutzer_id %>%
  map(function(id) download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?date=2016-10-01,2017-01-30&period=range&module=API&method=Live.getVisitorProfile&visitorId=", id, "&idSite=1&format=XML&limitVisits=1000&token_auth=", auth_token), paste0("benutzer_", id,".xml") )  )

## Alle 2014
benutzer_id %>%
  map(function(id) download.file( paste0("https://etpm-analytics.ph-karlsruhe.de/index.php?date=2014-10-20,2015-02-13&period=range&module=API&method=Live.getVisitorProfile&visitorId=", id, "&idSite=1&format=XML&limitVisits=1000&token_auth=", auth_token), paste0("benutzer_", id,".xml") )  )

# XML Dateien importieren 
# @INFO Achtung, sehr zeitintensiv!

## Mathe
benutzer_2016_mathe <- paste0("benutzer_", benutzer_id, ".xml") %>% 
  map(function(name) xmlToList(xmlParse( name )) )

## Alle 2014
benutzer_2014 <- paste0("benutzer_", benutzer_id, ".xml") %>% 
  map(function(name) xmlToList(xmlParse( name )) )

# Fake Nutzer
benutzer_2016_mathe <- benutzer_2016_mathe[-23]

# In Repository speichern

## Mathe
rmFromLocalRepo(names(asearch("name:benutzer_2016_mathe")), removeData = TRUE, removeMiniature = TRUE)
asave(benutzer_2016_mathe, archiveSessionInfo = FALSE)

## Alle 2014
rmFromLocalRepo(names(asearch("name:benutzer_2014")), removeData = TRUE, removeMiniature = TRUE)
asave(benutzer_2014, archiveSessionInfo = FALSE)
