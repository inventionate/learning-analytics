# Pakete laden
pacman::p_load(TimeSpaceAnalysis, questionr)

# Repository laden
source("repository.R")

# Datensatz aufbereiten

#datensatz_synthesise_users_gda <- 
  
datensatz_synthesise_users_gda <- datensatz_synthesise_users %>%
  mutate(total_visit_duration = quant.cut(round(total_visit_duration/60/60, 2), 4, labels = c("Besuchszeit: sehr gering", "Besuchszeit: gering", "Besuchszeit: lang", "Besuchszeit: sehr lang")),
         total_visits = quant.cut(as.numeric(total_visits), 4, labels = c("Gesamtbesuche: sehr wenige", "Gesamtbesuche: wenige", "Gesamtbesuche: viele", "Gesamtbesuche: sehr viele")),
         total_actions = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtaktionen: sehr wenige", "Gesamtaktionen: wenige", "Gesamtaktionen: viele", "Gesamtaktionen: sehr viele")),
         total_events = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtevents: sehr wenige", "Gesamtevents: wenige", "Gesamtevents: viele", "Gesamtevents: sehr viele")),
         average_visit_day = as_factor(average_visit_day),
         average_visit_hour = as.factor(average_visit_hour),
         average_visit_duration = quant.cut(as.numeric(average_visit_duration), 4, labels = c("Durchschnittliche Besuchszeit: sehr kurz", "Durchschnittliche Besuchszeit: kurz", "Durchschnittliche Besuchszeit: lang", "Durchschnittliche Besuchszeit: sehr lang")),
         average_visit_city = as.factor(average_visit_city),
         average_visit_devices = as_factor(average_visit_devices),
         average_visit_events = quant.cut(as.numeric(average_visit_events), 4, labels = c("Durchschnittliche Events: sehr wenige", "Durchschnittliche Events: wenige", "Durchschnittliche Events: viele", "Durchschnittliche Events: sehr viele")),
         visit_event_action_notes = quant.cut(as.numeric(visit_event_action_notes), 4, labels = c("Notizen: sehr wenige", "Notizen: wenige", "Notizen: viele", "Notizen: sehr viele")),
         visit_event_action_videos = quant.cut(as.numeric(visit_event_action_videos), 4, labels = c("Videoaktivitäten: sehr wenige", "Videoaktivitäten: wenige", "Videoaktivitäten: viele", "Videoaktivitäten: sehr viele")),
         visit_video_event_actions_pause = quant.cut(as.numeric(visit_event_action_videos), 4, labels = c("Pausen: sehr wenige", "Pausen: wenige", "Pausen: viele", "Pausen: sehr viele")),
         visit_video_event_actions_jump = quant.cut(as.numeric(visit_video_event_actions_jump), 4, labels = c("Sprünge: sehr wenige", "Sprünge: wenige", "Sprünge: viele", "Sprünge: sehr viele")),
         visit_video_event_actions_cuepoint = quant.cut(as.numeric(visit_video_event_actions_cuepoint), 4, labels = c("Fähnchensprünge: sehr wenige", "Fähnchensprünge: wenige", "Fähnchensprünge: viele", "Fähnchensprünge: sehr viele")),
         visit_video_event_actions_play = quant.cut(as.numeric(visit_video_event_actions_play), 4, labels = c("Abspielungen: sehr wenige", "Abspielungen: wenige", "Abspielungen: viele", "Abspielungen: sehr viele")),
         visit_video_event_actions_speed = quant.cut(as.numeric(visit_video_event_actions_speed), 4, labels = c("Geschwindigkeitsveränderungen: sehr wenige", "Geschwindigkeitsveränderungen: wenige", "Geschwindigkeitsveränderungen: viele", "Geschwindigkeitsveränderungen: sehr viele"))) %>%
  mutate_all(funs(as.factor)) %>%
  data.frame
  
# Imputation
# Notizen ausschließen, da sehr viele NA -> passiv setzen!
datensatz_synthesise_users_gda_impute <- imputeMCA(datensatz_synthesise_users_gda[,-c(11)])

# MCA berechnen
mca_res <- MCA(datensatz_synthesise_users_gda[,-c(11)], tab.disj = datensatz_synthesise_users_gda_impute$tab.disj, graph = FALSE)

# Eigenwerte untersuchen -> drei Dimensionen!
fviz_eig(mca_res)

# Aufgeklärte Varianz betrachten -> bei drei Dimensionen sind das 88.32%
modif.rate(mca_res)[1:5,]

# Individuen plotten
fviz_gda_conc_ellipse(mca_res, axes = c(1,2), title = "Learning Analytics — e:t:p:M@Math") 
fviz_gda_conc_ellipse(mca_res, axes = c(2,3), title = "Learning Analytics — e:t:p:M@Math")

# Kategorien plotten
# Zwei Horseshoes, die darauf schließen lassen, dass die 1. und 3 Dimension spannend sind
# Gruppierung nach "total" und "durchschnittlich", "aktionen"
group = c(4, 6, 6)
group_names = c("Gesamtwerte", "Durchschnittswerte", "Aktionen")
fviz_gda_var(mca_res, axes = c(1,2), group = group, group_names = group_names, title = "Learning Analytics — e:t:p:M@Math")
fviz_gda_var(mca_res, axes = c(2,3), group = group, group_names = group_names, title = "Learning Analytics — e:t:p:M@Math")

# Notizen als strukturierender Faktor
fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "visit_event_action_notes", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "visit_event_action_notes", impute = FALSE)

fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "average_visit_hour", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "average_visit_hour", impute = FALSE)

fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "average_visit_devices", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "average_visit_devices", impute = FALSE)

# HCPC

hcpc_res <- HCPC(mca_res, nb.clust = 3, graph = FALSE)

fviz_gda_quali_ellipses(mca_res, hcpc_res$data.clust, "clust", title = "Learning Analytics — e:t:p:M@Math — Cluster")

# In Repository speichern
rmFromLocalRepo(names(asearch("name:mca_res")), removeData = TRUE, removeMiniature = TRUE)
asave(mca_res, archiveSessionInfo = FALSE)
