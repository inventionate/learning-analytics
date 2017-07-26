# DGfE Tagung 2017 Berlin — **Universität 4.0**
#-----------------------------------------------------------------------#
# Umgabung vorbereiten
#-----------------------------------------------------------------------#
# Pakete laden
pacman::p_load(TimeSpaceAnalysis)
# Repository laden
source("repository.R")
source("survey_951135_R_syntax_file.R")
# Datensatz laden
loadFromLocalRepo(names(asearch("name:benutzer_alle")))
#-----------------------------------------------------------------------#
# Datensatz Learning Analytics
#-----------------------------------------------------------------------#

# Interaktionen auslesen
datensatz_interaktionen <- benutzer_alle %>% select(
  visitorId, 
  userId, 
  actions, 
  visitDuration,
  visitCount
  ) %>%
  filter( !is.na(userId) ) %>%
  group_by(visitorId, userId) %>%
  summarise_all(funs(sum)) %>%
  ungroup() %>%
  select(-visitorId) %>%
  rename(
    user_id = userId,
    actions = actions,
    visits = visitCount,
    duration = visitDuration
    )

#-----------------------------------------------------------------------#
# Datensatz online-Umfrage
#-----------------------------------------------------------------------#

# LimeSurvey auslesen
datensatz_limesurvey <- data %>% mutate(user_id = stringr::str_sub(refurl, start = 70)) %>% 
  select(user_id, 
         eigenverantwortliches_lernen = G1Q00001_2,
         dozenten = G1Q00001_3,
         mentoren_inhaltlich_hilfe = G1Q00001_4,
         mentoren_tandem = G1Q00001_5,
         mentoren_studium_hilfe = G1Q00001_6,
         mentoren_wiss_arbeit = G1Q00001_8,
         lernzuwachs = G1Q00001_7,
         reflexion = G1Q00001_9,
         erziehungswissenschaft = G1Q00001_11,
         zeitaufwand_angemessen = G2Q00001_1,
         zeitaufwand_vorbereitung = G2Q00001_2,
         mehr_zeit_gewuenscht = G2Q00001_3,
         online_lektionen_bevorzugt = G4Q00001_1,
         verfuegbarkeit_vevorzugt = G4Q00001_2,
         online_lektionen_intensiver_gelernt = G4Q00001_4,
         unabhaengigkeit_fester_termine = G4Q00001_8) %>% 
  mutate(
    eigenverantwortliches_lernen = fct_recode(eigenverantwortliches_lernen,
                                              "Eigenverantwortliches Lernen: kaum" = "trifft überhaupt nicht zu",
                                              "Eigenverantwortliches Lernen: kaum" = "trifft kaum zu",
                                              "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise nicht zu",
                                              "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise zu",
                                              "Eigenverantwortliches Lernen: sehr" = "trifft weitgehend zu",
                                              "Eigenverantwortliches Lernen: sehr" = "trifft voll zu"),
    dozenten = fct_recode(dozenten,
                                              "Dozenten häufiger: kaum" = "trifft überhaupt nicht zu",
                                              "Dozenten häufiger: kaum" = "trifft kaum zu",
                                              "Dozenten häufiger: teilweise" = "trifft teilweise nicht zu",
                                              "Dozenten häufiger: teilweise" = "trifft teilweise zu",
                                              "Dozenten häufiger: sehr" = "trifft weitgehend zu",
                                              "Dozenten häufiger: sehr" = "trifft voll zu"),
    mentoren_inhaltlich_hilfe = fct_recode(mentoren_inhaltlich_hilfe,
                                           "Mentoren inhaltliche Hilfe: kaum" = "trifft überhaupt nicht zu",
                                           "Mentoren inhaltliche Hilfe: kaum" = "trifft kaum zu",
                                           "Mentoren inhaltliche Hilfe: teilweise" = "trifft teilweise nicht zu",
                                           "Mentoren inhaltliche Hilfe: teilweise" = "trifft teilweise zu",
                                           "Mentoren inhaltliche Hilfe: sehr" = "trifft weitgehend zu",
                                           "Mentoren inhaltliche Hilfe: sehr" = "trifft voll zu"),
    mentoren_tandem = fct_recode(mentoren_tandem,
                                 "Mentoren Tandem: kaum" = "trifft überhaupt nicht zu",
                                 "Mentoren Tandem: kaum" = "trifft kaum zu",
                                 "Mentoren Tandem: teilweise" = "trifft teilweise nicht zu",
                                 "Mentoren Tandem: teilweise" = "trifft teilweise zu",
                                 "Mentoren Tandem: sehr" = "trifft weitgehend zu",
                                 "Mentoren Tandem: sehr" = "trifft voll zu"),
    mentoren_studium_hilfe = fct_recode(mentoren_studium_hilfe,
                                        "Mentoren Studium Hilfe: kaum" = "trifft überhaupt nicht zu",
                                        "Mentoren Studium Hilfe: kaum" = "trifft kaum zu",
                                        "Mentoren Studium Hilfe: teilweise" = "trifft teilweise nicht zu",
                                        "Mentoren Studium Hilfe: teilweise" = "trifft teilweise zu",
                                        "Mentoren Studium Hilfe: sehr" = "trifft weitgehend zu",
                                        "Mentoren Studium Hilfe: sehr" = "trifft voll zu"),
    mentoren_wiss_arbeit = fct_recode(mentoren_wiss_arbeit,
                                      "Mentoren wiss. Arbeiten: kaum" = "trifft überhaupt nicht zu",
                                      "Mentoren wiss. Arbeiten: kaum" = "trifft kaum zu",
                                      "Mentoren wiss. Arbeiten: teilweise" = "trifft teilweise nicht zu",
                                      "Mentoren wiss. Arbeiten: teilweise" = "trifft teilweise zu",
                                      "Mentoren wiss. Arbeiten: sehr" = "trifft weitgehend zu",
                                      "Mentoren wiss. Arbeiten: sehr" = "trifft voll zu"),
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
    erziehungswissenschaft = fct_recode(erziehungswissenschaft,
                                        "Interesse Erziehungswiss.: kaum" = "trifft überhaupt nicht zu",
                                        "Interesse Erziehungswiss.: kaum" = "trifft kaum zu",
                                        "Interesse Erziehungswiss.: teilweise" = "trifft teilweise nicht zu",
                                        "Interesse Erziehungswiss.: teilweise" = "trifft teilweise zu",
                                        "Interesse Erziehungswiss.: sehr" = "trifft weitgehend zu",
                                        "Interesse Erziehungswiss.: sehr" = "trifft voll zu"),
    zeitaufwand_angemessen = fct_recode(zeitaufwand_angemessen,
                                        "Angemessener Zeitaufwand: kaum" = "trifft überhaupt nicht zu",
                                        "Angemessener Zeitaufwand: kaum" = "trifft kaum zu",
                                        "Angemessener Zeitaufwand: teilweise" = "trifft teilweise nicht zu",
                                        "Angemessener Zeitaufwand: teilweise" = "trifft teilweise zu",
                                        "Angemessener Zeitaufwand: sehr" = "trifft weitgehend zu",
                                        "Angemessener Zeitaufwand: sehr" = "trifft voll zu"),
    zeitaufwand_vorbereitung = fct_recode(zeitaufwand_vorbereitung,
                                        "Genügend Vorbereitungszeit: kaum" = "trifft überhaupt nicht zu",
                                        "Genügend Vorbereitungszeit: kaum" = "trifft kaum zu",
                                        "Genügend Vorbereitungszeit: teilweise" = "trifft teilweise nicht zu",
                                        "Genügend Vorbereitungszeit: teilweise" = "trifft teilweise zu",
                                        "Genügend Vorbereitungszeit: sehr" = "trifft weitgehend zu",
                                        "Genügend Vorbereitungszeit: sehr" = "trifft voll zu"),
    mehr_zeit_gewuenscht = fct_recode(mehr_zeit_gewuenscht,
                                          "Mehr Lernzeit gewünscht: kaum" = "trifft überhaupt nicht zu",
                                          "Mehr Lernzeit gewünscht: kaum" = "trifft kaum zu",
                                          "Mehr Lernzeit gewünscht: teilweise" = "trifft teilweise nicht zu",
                                          "Mehr Lernzeit gewünscht: teilweise" = "trifft teilweise zu",
                                          "Mehr Lernzeit gewünscht: sehr" = "trifft weitgehend zu",
                                          "Mehr Lernzeit gewünscht: sehr" = "trifft voll zu"),
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
                                                     "online-Lektionen mehr gelernt: sehr" = "trifft voll zu"),
    unabhaengigkeit_fester_termine = fct_recode(unabhaengigkeit_fester_termine,
                                          "Flexibilität positiv: kaum" = "trifft überhaupt nicht zu",
                                          "Flexibilität positiv: kaum" = "trifft kaum zu",
                                          "Flexibilität positiv: teilweise" = "trifft teilweise nicht zu",
                                          "Flexibilität positiv: teilweise" = "trifft teilweise zu",
                                          "Flexibilität positiv: sehr" = "trifft weitgehend zu",
                                          "Flexibilität positiv: sehr" = "trifft voll zu")
  ) %>% as_tibble
datensatz_limesurvey

#-----------------------------------------------------------------------#
# Geometrische Modellierung 
#-----------------------------------------------------------------------#


# Datensatz zusammenstellen
datensatz_final <- full_join(datensatz_interaktionen, datensatz_limesurvey, by = "user_id") %>%
  select(-user_id) %>%
  rownames_to_column(var = "questionnaire_id") %>%
  gda_optimise_df %>%
  mutate_at(1:3, funs(as.numeric(as.character(.)))) %>%
  mutate(
    actions = questionr::quant.cut(
      actions, 3, labels = c("Gesamtaktionen: wenige", "Gesamtaktionen: durchschnittlich", "Gesamtaktionen: viele")
    ),
    duration = questionr::quant.cut(
      round(duration/60/60, 2), 3, labels = c("Besuchszeit: kurz", "Besuchszeit: durchschnittlich", "Besuchszeit: lang")
    ),
    visits = questionr::quant.cut(
      visits, 3, labels = c("Gesamtbesuche: wenige", "Gesamtbesuche: durchschnittlich", "Gesamtbesuche: viele")
    )) %>%
  select(
    # Gruppe Interaktionen
    actions,
    visits,
    duration, 
    # Gruppe Personalisierung
    dozenten,
    mentoren_inhaltlich_hilfe,
    mentoren_studium_hilfe, 
    online_lektionen_bevorzugt,
    verfuegbarkeit_vevorzugt, 
    unabhaengigkeit_fester_termine, 
    # Gruppe Reflexivität
    reflexion, 
    online_lektionen_intensiver_gelernt, 
    eigenverantwortliches_lernen,
    lernzuwachs) %>%
  as_tibble


#-----------------------------------------------------------------------#
# MCA Berechnung
#-----------------------------------------------------------------------#

# Imputation
datensatz_final_imputiert <- imputeMCA(datensatz_final)

# spMCA berechnen
resultat_mca <- MCA(datensatz_final, graph = FALSE, excl = c(10, 13), tab.disj = datensatz_final_imputiert$tab.disj)

fviz_eig(resultat_mca)

modif.rate(resultat_mca)

gda_describe_group(resultat_mca, group = c(3, 6, 4), group_names = c("Interaktionen Web-App", "Personalisierung", "Reflexivität"))


# HCPC berechnen
resultat_mca_hcpc <- HCPC(resultat_mca, nb.clust = 3, graph = FALSE)
# Clusterkoordianten extrahieren
koordinaten_ind_ellipsen <- bind_cols(data.frame(resultat_mca$ind$coord), data.frame(clust = resultat_mca_hcpc$data.clust$clust))
koordinaten_ind_ellipsen_anzahl <- koordinaten_ind_ellipsen %>% 
  select(clust, size = Dim.1) %>% 
  group_by(clust) %>% 
  summarise_all(funs(length)) %>% 
  mutate(size = round((100 * size) / nrow(resultat_mca$ind$coord), 0))
koordinaten_ind_ellipsen_mittelwert <- koordinaten_ind_ellipsen %>% 
  group_by(clust) %>% 
  summarise_all(funs(mean))
koordinaten_ind_ellipsen_mittelwert_anzahl <- full_join(koordinaten_ind_ellipsen_mittelwert, koordinaten_ind_ellipsen_anzahl, by = "clust")

# Grafiken erstellen
plot_mca <- fviz_gda_var(resultat_mca, group = c(3, 6, 4), group_names = c("Interaktionen Web-App", "Personalisierung", "Reflexivität"), contrib = "auto", group_style = "shape", title ="") +
  guides(shape = guide_legend(override.aes = list(size = 3))) +
  theme(legend.title = element_blank(), 
        legend.text = element_text(size = 18),
        legend.position=c(0.85,0.95),
        legend.justification = "center",
        legend.background = element_rect(fill = "gray99"))

# Ergebnisse der HCPC hinzufügen  
plot_mca_ellipsen <- plot_mca + 
  stat_ellipse(data = koordinaten_ind_ellipsen, aes(Dim.1, Dim.2, group = clust), geom ="polygon", level = 0.8647, type = "norm", alpha = 0.05, colour = "black", linetype = "dashed", segments = 100) +
  geom_label(data = koordinaten_ind_ellipsen_mittelwert_anzahl, aes(Dim.1, Dim.2, label = paste0("Profil ", clust ,": ", size, "%")), family = "Myriad Pro", size = 5) 

plot_mca_ellipsen
ggsave("dgfe_mca_ellipsen.pdf", plot_mca_ellipsen, height = 10, width = 10)

plot_mca_kontur <- plot_mca + 
  geom_density2d(data = resultat_mca$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.75, colour = "gray") +
  geom_label(data = koordinaten_ind_ellipsen_mittelwert_anzahl, aes(Dim.1, Dim.2, label = paste0("Profil ", clust ,": ", size, "%")), family = "Myriad Pro", size = 5) 

plot_mca_kontur
ggsave("dgfe_mca_kontur.pdf", plot_mca_kontur, height = 10, width = 10)
