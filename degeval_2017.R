#***********************************************************************
# DeGEval Tagung 2017 Wien ---------------------------------------------
# © Fabian Mundt <f.mundt@inventionate.de>
#***********************************************************************

#***********************************************************************
# Umgabung vorbereiten -------------------------------------------------
#***********************************************************************

# Pakete laden
pacman::p_load_gh("Inventionate/TimeSpaceAnalysis")
pacman::p_load("glue")

# Repository laden
source("repository.R")

# Datensatz laden
loadFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014")))
source("survey_951135_R_syntax_file.R")

#***********************************************************************
# Datensatz Learning Analytics -----------------------------------------
#***********************************************************************

datensatz_learning_analytics <- datensatz_synthesise_users_2014 %>% select(
  user_id = userId,
  besuchszeit_durchschnitt = average_visit_duration,
  aktionen_durchschnitt = average_visit_events,
  notizen_gesamt = visit_event_action_notes,
  pausen_gesamt = visit_video_event_actions_pause,
  faehnchen_gesamt = visit_video_event_actions_cuepoint,
  spruenge_gesamt = visit_video_event_actions_speed)

#***********************************************************************
# Datensatz online-Umfrage ---------------------------------------------
#***********************************************************************

datensatz_online_umfrage <- data_limesurvey %>% 
  mutate(user_id = stringr::str_sub(refurl, start = 70)) %>% 
  select(user_id, 
         eigenverantwortliches_lernen = G1Q00001_2,
         mentoren_studium_hilfe = G1Q00001_6,
         lernzuwachs = G1Q00001_7,
         reflexion = G1Q00001_9,
         zeitaufwand_angemessen = G2Q00001_1,
         online_lektionen_bevorzugt = G4Q00001_1,
         verfuegbarkeit_vevorzugt = G4Q00001_2,
         online_lektionen_intensiver_gelernt = G4Q00001_4) %>% 
  mutate(
    eigenverantwortliches_lernen = fct_recode(eigenverantwortliches_lernen,
                                              "Eigenverantwortliches Lernen: kaum" = "trifft überhaupt nicht zu",
                                              "Eigenverantwortliches Lernen: kaum" = "trifft kaum zu",
                                              "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise nicht zu",
                                              "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise zu",
                                              "Eigenverantwortliches Lernen: sehr" = "trifft weitgehend zu",
                                              "Eigenverantwortliches Lernen: sehr" = "trifft voll zu"),
    mentoren_studium_hilfe = fct_recode(mentoren_studium_hilfe,
                                        "Mentoren Studium Hilfe: kaum" = "trifft überhaupt nicht zu",
                                        "Mentoren Studium Hilfe: kaum" = "trifft kaum zu",
                                        "Mentoren Studium Hilfe: teilweise" = "trifft teilweise nicht zu",
                                        "Mentoren Studium Hilfe: teilweise" = "trifft teilweise zu",
                                        "Mentoren Studium Hilfe: sehr" = "trifft weitgehend zu",
                                        "Mentoren Studium Hilfe: sehr" = "trifft voll zu"),
    lernzuwachs = fct_recode(lernzuwachs,
                             "Lernzuwachs: kaum" = "trifft überhaupt nicht zu",
                             "Lernzuwachs: kaum" = "trifft kaum zu",
                             "Lernzuwachs: teilweise" = "trifft teilweise nicht zu",
                             "Lernzuwachs: teilweise" = "trifft teilweise zu",
                             "Lernzuwachs: sehr" = "trifft weitgehend zu",
                             "Lernzuwachs: sehr" = "trifft voll zu"),
    reflexion = fct_recode(reflexion,
                           "Reflexionszuwachs: kaum" = "trifft überhaupt nicht zu",
                           "Reflexionszuwachs: kaum" = "trifft kaum zu",
                           "Reflexionszuwachs: teilweise" = "trifft teilweise nicht zu",
                           "Reflexionszuwachs: teilweise" = "trifft teilweise zu",
                           "Reflexionszuwachs: sehr" = "trifft weitgehend zu",
                           "Reflexionszuwachs: sehr" = "trifft voll zu"),
    zeitaufwand_angemessen = fct_recode(zeitaufwand_angemessen,
                                        "Angemessener Zeitaufwand: kaum" = "trifft überhaupt nicht zu",
                                        "Angemessener Zeitaufwand: kaum" = "trifft kaum zu",
                                        "Angemessener Zeitaufwand: teilweise" = "trifft teilweise nicht zu",
                                        "Angemessener Zeitaufwand: teilweise" = "trifft teilweise zu",
                                        "Angemessener Zeitaufwand: sehr" = "trifft weitgehend zu",
                                        "Angemessener Zeitaufwand: sehr" = "trifft voll zu"),
    online_lektionen_bevorzugt = fct_recode(online_lektionen_bevorzugt,
                                            "online-Lektionen bevorzugt: kaum" = "trifft überhaupt nicht zu",
                                            "online-Lektionen bevorzugt: kaum" = "trifft kaum zu",
                                            "online-Lektionen bevorzugt: teilweise" = "trifft teilweise nicht zu",
                                            "online-Lektionen bevorzugt: teilweise" = "trifft teilweise zu",
                                            "online-Lektionen bevorzugt: sehr" = "trifft weitgehend zu",
                                            "online-Lektionen bevorzugt: sehr" = "trifft voll zu"),
    verfuegbarkeit_vevorzugt = fct_recode(verfuegbarkeit_vevorzugt,
                                            "Verfügbarkeit positiv: kaum" = "trifft überhaupt nicht zu",
                                            "Verfügbarkeit positiv: kaum" = "trifft kaum zu",
                                            "Verfügbarkeit positiv: teilweise" = "trifft teilweise nicht zu",
                                            "Verfügbarkeit positiv: teilweise" = "trifft teilweise zu",
                                            "Verfügbarkeit positiv: sehr" = "trifft weitgehend zu",
                                            "Verfügbarkeit positiv: sehr" = "trifft voll zu"),
    online_lektionen_intensiver_gelernt = fct_recode(online_lektionen_intensiver_gelernt,
                                                     "online-Lektionen mehr gelernt: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektionen mehr gelernt: kaum" = "trifft kaum zu",
                                                     "online-Lektionen mehr gelernt: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektionen mehr gelernt: teilweise" = "trifft teilweise zu",
                                                     "online-Lektionen mehr gelernt: sehr" = "trifft weitgehend zu",
                                                     "online-Lektionen mehr gelernt: sehr" = "trifft voll zu"))

#***********************************************************************
# Geometrische Modellierung --------------------------------------------
#***********************************************************************

# Datensatz zusammenstellen
datensatz_final <- full_join(
  datensatz_learning_analytics, 
  datensatz_online_umfrage, 
  by = "user_id") %>%
  select(-user_id) %>%
  gda_optimise_df %>%
  filter( !(row_number() %in% c(3, 8, 55)) ) %>%
  mutate_at(1, funs(./60)) %>%
  data.frame
  
# Imputation
datensatz_final_imputiert <-imputeMFA(datensatz_final, group = c(6, 8), type = c("s", "n"))

# MFA berechnen
resultat_mfa <- MFA(datensatz_final, tab.comp = datensatz_final_imputiert, group = c(6, 8), type = c("s", "n"), name.group = c("Learning Analytics", "online-Umfrage"), graph = FALSE)

# Grafiken
fviz_mfa_axes(resultat_mfa)
fviz_mfa_var(resultat_mfa, choice = "quanti.var", repel = TRUE)
fviz_mfa_var(resultat_mfa, choice = "quali.var", repel = TRUE)
fviz_mfa_var(resultat_mfa, choice = "group")
fviz_mfa_ind(resultat_mfa, geom = "point", col.ind = "black")
fviz_mfa_ind(resultat_mfa, partial = "All", geom = "point")

# HCPC berechnen
resultat_hcpc <- HCPC(resultat_mfa, nb.clust = 3, graph = FALSE)

# Datensatz extrahieren
cluster_koordinaten <- resultat_mfa$ind$coord %>% as_tibble %>% add_column(cluster = resultat_hcpc$data.clust$clust) %>% 
  group_by(cluster) %>% summarise_all(mean)

datensatz_cluster <- resultat_hcpc$data.clust$clust %>% fct_count %>% 
  mutate(prop = n * 100 / sum(n) ) %>% rename(cluster = f) %>%
  right_join(., cluster_koordinaten, by = "cluster")

# Grafiken
fviz_cluster(resultat_hcpc, geom = "point", ellipse.type = "norm", ellipse.level = 0.86) 

# TSA Paket
fviz_gda_quali_ellipses(resultat_mfa, df_var_quali = resultat_hcpc$data.clust, var_quali = "clust", facet = FALSE)
fviz_gda_quali_ellipses(resultat_mfa, df_var_quali = data.frame(resultat_hcpc$data.clust), var_quali = "clust", facet = TRUE, confidence_ellipses = TRUE)

# Kennwerte
resultat_mfa$inertia.ratio
resultat_mfa$group
resultat_hcpc$desc.var$category$`1`
resultat_hcpc$desc.var$quanti$`1`
resultat_hcpc$desc.var$category$`2`
resultat_hcpc$desc.var$quanti$`2`
resultat_hcpc$desc.var$category$`3`
resultat_hcpc$desc.var$quanti$`3`

# Anzahl der Personen
describe(resultat_hcpc$data.clust$clust)

# Grafiken Publikation
gcomma <- function(x) format(x, decimal.mark = ",") 

fviz_mfa_var(resultat_mfa, choice = "quanti.var", repel = TRUE, col.var = "black", col.circle = "black", 
             axes.linetype = "solid", font.family = "Myriad Pro", title = "", labelsize = 3,
             xlab = glue("Achse 1 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[1], 1))}%)"),
             ylab = glue("Achse 2 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[2], 1))}%)")) +
  theme(
    panel.border = element_rect(fill = "transparent", colour = "black", size = 1, linetype = "solid"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 12)) +
  scale_x_continuous(labels = gcomma) +
  scale_y_continuous(labels = gcomma)
ggsave("degeval_mfa_quanti.pdf", width = 128, units = "mm")

fviz_mfa_var(resultat_mfa, choice = "quali.var", repel = TRUE, col.var = "black", axes.linetype = "solid", 
             font.family = "Myriad Pro", title = "", labelsize = 3,
             xlab = glue("Achse 1 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[1], 1))}%)"),
             ylab = glue("Achse 2 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[2], 1))}%)")) + 
  coord_fixed() +
  theme(
    panel.border = element_rect(fill = "transparent", colour = "black", size = 1, linetype = "solid"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 12)) +
  scale_x_continuous(labels = gcomma) +
  scale_y_continuous(labels = gcomma)
ggsave("degeval_mfa_quali.pdf", width = 128, units = "mm")

fviz_mfa_ind(resultat_mfa, geom = "point", col.ind = "black", font.family = "Myriad Pro", title = "",
             xlab = glue("Achse 1 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[1], 1))}%)"),
             ylab = glue("Achse 2 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[2], 1))}%)")) + 
  coord_fixed() + 
  theme(
    panel.border = element_rect(fill = "transparent", colour = "black", size = 1, linetype = "solid"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 12)) +
  scale_x_continuous(labels = gcomma) +
  scale_y_continuous(labels = gcomma)
ggsave("degeval_mfa_ind.pdf", width = 128, units = "mm")

fviz_cluster(resultat_hcpc, geom = "point", ellipse.type = "norm", ellipse.level = 0.86, show.clust.cent = FALSE,
             palette = c("gray10", "gray70", "gray40"), font.family = "Myriad Pro", main = "",
             xlab = glue("Achse 1 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[1], 1))}%)"),
             ylab = glue("Achse 2 ({gcomma(round(resultat_mfa$eig$`percentage of variance`[2], 1))}%)")) +
             geom_hline(yintercept = 0) + geom_vline(xintercept = 0) + coord_fixed() +
  theme(
    legend.position = "none", 
    panel.background = element_blank(),
    panel.border = element_rect(fill = "transparent", colour = "black", size = 1, linetype = "solid"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 12)) +
  # Die Gruppengewichte der Clusterprofile hinzufügen
  geom_label(data = datensatz_cluster, aes(Dim.1, Dim.2, label = glue("Profil {cluster}: {gcomma(round(prop, 1))}%"), size = n), family = "Myriad Pro") +
  scale_size(range = c(4,5)) +
  scale_x_continuous(labels = gcomma) +
  scale_y_continuous(labels = gcomma)
ggsave("degeval_mfa_cluster.pdf", width = 128, units = "mm")
