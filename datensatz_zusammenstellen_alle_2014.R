# Pakete laden
pacman::p_load_gh("Inventionate/TimeSpaceAnalysis")

# Repository laden
source("repository.R")

# Daten laden
loadFromLocalRepo(names(asearch("name:benutzer_2014")))

# Datensatz zusammenstellen
# Geplante Struktur

# userId
# Dauer App
# Besuche App
# Dauer pro oL
# Nutzungstag
# Anzahl der Aktionen (Sprünge, Abspielungen, Pausen, Notizen)
# Ort der Nutzung
# Kontinuität der Nutzung

userId <- frequently_visit_day <- frequently_visit_hour <- average_visit_duration <- frequently_visit_devices <- frequently_visit_city <- average_visit_events <-visit_event_action_notes <- visit_event_action_videos <- visit_video_event_actions_pause <- visit_video_event_actions_jump <- visit_video_event_actions_cuepoint <- visit_video_event_actions_play <- visit_video_event_actions_speed <- total_visit_duration <- total_visits <- total_actions <- total_events <- NULL

for( user in seq_along(benutzer_2014) ) {
  
  userId <- c(userId, benutzer_2014[[user]]$userId)
  
  visit_days <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    visit_days <- c(visit_days, as.character(lubridate::wday(lubridate::as_date(benutzer_2014[[user]]$lastVisits[[i]]$serverDate), label = TRUE, abbr = FALSE)))
    
  }
  frequently_visit_day <- c(frequently_visit_day, names(which.max(table(visit_days))))
  
  visit_hours <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    visit_hours <- c(visit_hours, as.numeric(benutzer_2014[[user]]$lastVisits[[i]]$visitServerHour))
    
    
  }
  frequently_visit_hour <- c(frequently_visit_hour, round(mean(visit_hours), 0))
  
  visit_durations <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    visit_durations <- c(visit_durations, lubridate::duration(as.numeric(benutzer_2014[[user]]$lastVisits[[i]]$visitDuration, "seconds")))
    
  }
  
  average_visit_duration <- c(average_visit_duration, lubridate::duration(round(mean(visit_durations), 0), "seconds"))
  
  
  visit_devices <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    visit_devices <- c(visit_devices, benutzer_2014[[user]]$lastVisits[[i]]$deviceType)
    
  }
  frequently_visit_devices <- c(frequently_visit_devices, names(which.max(table(visit_devices))))
  
  
  visit_cities <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    if ( is.null(benutzer_2014[[user]]$lastVisits[[i]]$city) ) city <- NA
    else city <- benutzer_2014[[user]]$lastVisits[[i]]$city
    
    visit_cities <- c(visit_cities, city)
    
  }
  city_max <- names(which.max(table(visit_cities)))
  
  if( is.null(city_max) ) city_max <- NA 
  
  frequently_visit_city <- c(frequently_visit_city, city_max)
  
  
  visit_events <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    visit_events <- c(visit_events, benutzer_2014[[user]]$lastVisits[[i]]$events)
    
  }
  average_visit_events <- c(average_visit_events, round(mean(as.numeric(visit_events)), 0))

  # Allgemeine Events
  visit_event_actions <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    if( benutzer_2014[[user]]$lastVisits[[i]]$events == 0 ) {
      
      visit_event_actions <- c(visit_event_actions, 0)
      
    } else {
     
      for(e in seq_along(benutzer_2014[[user]]$lastVisits[[i]]$actionDetails) ) {
        
        visit_event_actions <- c(visit_event_actions, benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$eventCategory)
        
      }
      
    }
    
  }
  visit_event_actions <- visit_event_actions %>% as.factor %>% fct_count %>% spread(f, n)
  
  if( is.null(visit_event_actions$Notiz) ) visit_event_action_notes <- c(visit_event_action_notes, 0)
  else visit_event_action_notes <- c(visit_event_action_notes, visit_event_actions$Notiz)
  
  if( is.null(visit_event_actions$Video) ) visit_event_action_videos <- c(visit_event_action_videos, 0)
  else visit_event_action_videos <- c(visit_event_action_videos, visit_event_actions$Video)
  
  # Video events
  visit_video_event_actions <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    if( benutzer_2014[[user]]$lastVisits[[i]]$events == 0 ) {
      
      visit_video_event_actions <- c(visit_video_event_actions, 0)
      
    } else {
    
      for(e in seq_along(benutzer_2014[[user]]$lastVisits[[i]]$actionDetails) ) {
        
        visit_video_event_actions <- c(visit_video_event_actions, benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$eventAction)
        
      }
    
      }
    
  }
  
  visit_video_event_actions <- visit_video_event_actions %>% as.factor %>% fct_count %>% spread(f, n)
  
  if( is.null(visit_video_event_actions$Pausiert) ) visit_video_event_actions_pause <- c(visit_video_event_actions_pause, 0)
  else visit_video_event_actions_pause <- c(visit_video_event_actions_pause, visit_video_event_actions$Pausiert)
  
  if( is.null(visit_video_event_actions$Springen) ) visit_video_event_actions_jump <- c(visit_video_event_actions_jump, 0)
  else visit_video_event_actions_jump <- c(visit_video_event_actions_jump, visit_video_event_actions$Springen)
  
  if( is.null(visit_video_event_actions$`Zu Fähnchen gesprungen`) )visit_video_event_actions_cuepoint <-c(visit_video_event_actions_cuepoint, 0)
  else visit_video_event_actions_cuepoint <-c(visit_video_event_actions_cuepoint, visit_video_event_actions$`Zu Fähnchen gesprungen`)
  
  if( is.null(visit_video_event_actions$Abgespielt) ) visit_video_event_actions_play <- c(visit_video_event_actions_play, 0)
  else visit_video_event_actions_play <- c(visit_video_event_actions_play, visit_video_event_actions$Abgespielt)
  
  if( is.null(visit_video_event_actions$`Geschwindigkeit verändert`) ) visit_video_event_actions_speed <- c(visit_video_event_actions_speed, 0)
  else visit_video_event_actions_speed <- c(visit_video_event_actions_speed, visit_video_event_actions$`Geschwindigkeit verändert`)
  
  total_visit_duration <- c(total_visit_duration, lubridate::duration(as.numeric(benutzer_2014[[user]]$totalVisitDuration), "seconds"))
  
  total_visits <- c(total_visits, benutzer_2014[[user]]$totalVisits)
  
  total_actions <- c(total_actions, benutzer_2014[[user]]$totalActions)
  
  total_events <- c(total_events, benutzer_2014[[user]]$totalEvents)
  
}

# Data frame basteln
datensatz_synthesise_users_2014 <- tibble(
  
  userId = userId,
  
  total_visit_duration = total_visit_duration,
  
  total_visits = total_visits,
  
  total_actions = total_actions,
  
  total_events = total_events,
  
  average_visit_duration = average_visit_duration,
  
  average_visit_events = average_visit_events,
  
  frequently_visit_day = frequently_visit_day,
  
  frequently_visit_hour = frequently_visit_hour,
  
  frequently_visit_city = frequently_visit_city,
  
  frequently_visit_devices = frequently_visit_devices,
  
  visit_event_action_notes = visit_event_action_notes,
  
  visit_event_action_videos = visit_event_action_videos,
  
  visit_video_event_actions_pause = visit_video_event_actions_pause,
  
  visit_video_event_actions_jump = visit_video_event_actions_jump,
  
  visit_video_event_actions_cuepoint = visit_video_event_actions_cuepoint,
  
  visit_video_event_actions_play = visit_video_event_actions_play,
  
  visit_video_event_actions_speed = visit_video_event_actions_speed
  
)

# In Repository speichern
rmFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014")), removeData = TRUE, removeMiniature = TRUE)
asave(datensatz_synthesise_users_2014, archiveSessionInfo = FALSE)
