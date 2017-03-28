visit_video_event_actions_pause_mittelalter <- visit_video_event_actions_jump_mittelalter <- visit_video_event_actions_cuepoint_mittelalter <- visit_video_event_actions_play_mittelalter <- visit_video_event_actions_speed_mittelalter <- visit_video_event_actions_duration_mittelalter <- NULL

for( user in seq_along(benutzer_2014) ) {
  
  # Video events
  visit_video_event_actions <- visit_video_event_time <- NULL
  for(i in 1:benutzer_2014[[user]]$totalVisits) {
    
    if ( benutzer_2014[[user]]$lastVisits[[i]]$events != 0 ) {}
    
      for(e in seq_along(benutzer_2014[[user]]$lastVisits[[i]]$actionDetails) ) {
        
        if (benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]] !=  "\n\t\t\t" ) {
        
        if ( !is.null(benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$eventName)) {
          
          if ( benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$eventName == "Mittelalter" ) {
          
             visit_video_event_actions <- c(visit_video_event_actions, benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$eventAction)
             
             visit_video_event_time <- c(visit_video_event_time, benutzer_2014[[user]]$lastVisits[[i]]$actionDetails[[e]]$timeSpent)
          
          }
        }
        }
      }
    }

  if ( is.null(visit_video_event_actions) ) {
    
    visit_video_event_actions_pause_mittelalter <- c(visit_video_event_actions_pause_mittelalter, 0)
    visit_video_event_actions_jump_mittelalter <- c(visit_video_event_actions_jump_mittelalter, 0)
    visit_video_event_actions_play_mittelalter <- c(visit_video_event_actions_play_mittelalter, 0)
    visit_video_event_actions_speed_mittelalter <- c(visit_video_event_actions_speed_mittelalter, 0)
    
  } else {
   
    visit_video_event_actions <- visit_video_event_actions %>% as.factor %>% fct_count %>% spread(f, n)
    
    
    if( is.null(visit_video_event_actions$Pausiert) ) visit_video_event_actions_pause_mittelalter <- c(visit_video_event_actions_pause_mittelalter, 0)
    else visit_video_event_actions_pause_mittelalter <- c(visit_video_event_actions_pause_mittelalter, visit_video_event_actions$Pausiert)
    
    if( is.null(visit_video_event_actions$Springen) ) visit_video_event_actions_jump_mittelalter <- c(visit_video_event_actions_jump_mittelalter, 0)
    else visit_video_event_actions_jump_mittelalter <- c(visit_video_event_actions_jump_mittelalter, visit_video_event_actions$Springen)
    
    if( is.null(visit_video_event_actions$Abgespielt) ) visit_video_event_actions_play_mittelalter <- c(visit_video_event_actions_play_mittelalter, 0)
    else visit_video_event_actions_play_mittelalter <- c(visit_video_event_actions_play_mittelalter, visit_video_event_actions$Abgespielt)
    
    if( is.null(visit_video_event_actions$`Geschwindigkeit verändert`) ) visit_video_event_actions_speed_mittelalter <- c(visit_video_event_actions_speed_mittelalter, 0)
    else visit_video_event_actions_speed_mittelalter <- c(visit_video_event_actions_speed_mittelalter, visit_video_event_actions$`Geschwindigkeit verändert`)
     
  }
  
  
  if ( is.null(visit_video_event_time) ) {
    
    visit_video_event_actions_duration_mittelalter <- c(visit_video_event_actions_duration_mittelalter, 0)
  
  } else {
    
    visit_video_event_actions_duration_mittelalter <- c(visit_video_event_actions_duration_mittelalter, sum(as.numeric(visit_video_event_time)) )
     
  }
  
}

# Data frame basteln
datensatz_synthesise_users_2014_mittelalter <- data_frame(
  
  visit_video_event_actions_pause_mittelalter = visit_video_event_actions_pause_mittelalter,
  
  visit_video_event_actions_jump_mittelalter = visit_video_event_actions_jump_mittelalter,
  
  visit_video_event_actions_play_mittelalter = visit_video_event_actions_play_mittelalter,
  
  visit_video_event_actions_speed_mittelalter = visit_video_event_actions_speed_mittelalter,
  
  visit_video_event_actions_duration_mittelalter = visit_video_event_actions_duration_mittelalter

)

# In Repository speichern
rmFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014_mittelalter")), removeData = TRUE, removeMiniature = TRUE)
asave(datensatz_synthesise_users_2014_mittelalter, archiveSessionInfo = FALSE)
