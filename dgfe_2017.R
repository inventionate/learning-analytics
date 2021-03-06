# DGfE Tagung 2017 Berlin — **Universität 4.0**
#-----------------------------------------------------------------------#
# Umgabung vorbereiten
#-----------------------------------------------------------------------#
# Pakete laden
pacman::p_load_gh("Inventionate/TimeSpaceAnalysis")
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
                                              "Eigenverantwortl. Lernen: kaum" = "trifft überhaupt nicht zu",
                                              "Eigenverantwortl. Lernen: kaum" = "trifft kaum zu",
                                              "Eigenverantwortl. Lernen: teilweise" = "trifft teilweise nicht zu",
                                              "Eigenverantwortl. Lernen: teilweise" = "trifft teilweise zu",
                                              "Eigenverantwortl. Lernen: sehr" = "trifft weitgehend zu",
                                              "Eigenverantwortl. Lernen: sehr" = "trifft voll zu"),
    dozenten = fct_recode(dozenten,
                                              "Doz. Präsenz ausr.: kaum" = "trifft überhaupt nicht zu",
                                              "Doz. Präsenz ausr.: kaum" = "trifft kaum zu",
                                              "Doz. Präsenz ausr.: teilweise" = "trifft teilweise nicht zu",
                                              "Doz. Präsenz ausr.: teilweise" = "trifft teilweise zu",
                                              "Doz. Präsenz ausr.: sehr" = "trifft weitgehend zu",
                                              "Doz. Präsenz ausr.: sehr" = "trifft voll zu"),
    mentoren_inhaltlich_hilfe = fct_recode(mentoren_inhaltlich_hilfe,
                                           "Mentoren inhaltl. Hilfe: kaum" = "trifft überhaupt nicht zu",
                                           "Mentoren inhaltl. Hilfe: kaum" = "trifft kaum zu",
                                           "Mentoren inhaltl. Hilfe: teilweise" = "trifft teilweise nicht zu",
                                           "Mentoren inhaltl. Hilfe: teilweise" = "trifft teilweise zu",
                                           "Mentoren inhaltl. Hilfe: sehr" = "trifft weitgehend zu",
                                           "Mentoren inhaltl. Hilfe: sehr" = "trifft voll zu"),
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
                                            "oL bevorzugt: kaum" = "trifft überhaupt nicht zu",
                                            "oL bevorzugt: kaum" = "trifft kaum zu",
                                            "oL bevorzugt: teilweise" = "trifft teilweise nicht zu",
                                            "oL bevorzugt: teilweise" = "trifft teilweise zu",
                                            "oL bevorzugt: sehr" = "trifft weitgehend zu",
                                            "oL bevorzugt: sehr" = "trifft voll zu"),
    verfuegbarkeit_vevorzugt = fct_recode(verfuegbarkeit_vevorzugt,
                                            "Verfügb. positiv: kaum" = "trifft überhaupt nicht zu",
                                            "Verfügb. positiv: kaum" = "trifft kaum zu",
                                            "Verfügb. positiv: teilweise" = "trifft teilweise nicht zu",
                                            "Verfügb. positiv: teilweise" = "trifft teilweise zu",
                                            "Verfügb. positiv: sehr" = "trifft weitgehend zu",
                                            "Verfügb. positiv: sehr" = "trifft voll zu"),
    online_lektionen_intensiver_gelernt = fct_recode(online_lektionen_intensiver_gelernt,
                                                     "oL mehr gelernt: kaum" = "trifft überhaupt nicht zu",
                                                     "oL mehr gelernt: kaum" = "trifft kaum zu",
                                                     "oL mehr gelernt: teilweise" = "trifft teilweise nicht zu",
                                                     "oL mehr gelernt: teilweise" = "trifft teilweise zu",
                                                     "oL mehr gelernt: sehr" = "trifft weitgehend zu",
                                                     "oL mehr gelernt: sehr" = "trifft voll zu"),
    unabhaengigkeit_fester_termine = fct_recode(unabhaengigkeit_fester_termine,
                                          "Flexibil. positiv: kaum" = "trifft überhaupt nicht zu",
                                          "Flexibil. positiv: kaum" = "trifft kaum zu",
                                          "Flexibil. positiv: teilweise" = "trifft teilweise nicht zu",
                                          "Flexibil. positiv: teilweise" = "trifft teilweise zu",
                                          "Flexibil. positiv: sehr" = "trifft weitgehend zu",
                                          "Flexibil. positiv: sehr" = "trifft voll zu")
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
  mutate(size = round((100 * size) / nrow(resultat_mca$ind$coord), 1))
koordinaten_ind_ellipsen_mittelwert <- koordinaten_ind_ellipsen %>% 
  group_by(clust) %>% 
  summarise_all(funs(mean))
koordinaten_ind_ellipsen_mittelwert_anzahl <- full_join(koordinaten_ind_ellipsen_mittelwert, koordinaten_ind_ellipsen_anzahl, by = "clust")

# Grafiken erstellen
gcomma <- function(x) format(x, decimal.mark = ",") 

plot_mca <- fviz_gda_var(resultat_mca, group = c(3, 6, 4), 
                         group_names = c("Interaktionen Web-App", "Personalisierung", "Reflexivität"), 
                         contrib = "auto", 
                         group_style = "shape", 
                         title ="",
                         textsize = 5.5) +
  guides(shape = guide_legend(override.aes = list(size = 3))) +
  theme(text = element_text(size = 14),
        legend.title = element_blank(), 
        legend.text = element_text(size = 17),
        legend.position=c(0.82,0.92),
        legend.justification = "center",
        legend.background = element_rect(fill = "gray99"),
        panel.grid = element_blank(),
        axis.ticks = element_line(),
        axis.title = element_text(face = "plain", size = 15),
        panel.border = element_rect(fill = NA, size = 1))
# Ergebnisse der HCPC hinzufügen  
plot_mca_ellipsen <- plot_mca + 
  stat_ellipse(data = koordinaten_ind_ellipsen, aes(Dim.1, Dim.2, group = clust), geom ="polygon", level = 0.8647, type = "norm", alpha = 0.05, colour = "black", linetype = "dashed", segments = 100) +
  geom_label(data = koordinaten_ind_ellipsen_mittelwert_anzahl, aes(Dim.1, Dim.2, label = paste0("Profil ", clust ,": ", gcomma(size), "%"), size = size * 3), family = "Myriad Pro", fontface = "bold") +
  xlab(paste0("Achse 1 (", gcomma(round(resultat_mca$eig$eigenvalue[1], 3)), "; ", gcomma(round(resultat_mca$eig$`modified rates`[1], 1)) ,"%)")) +
  ylab(paste0("Achse 2 (", gcomma(round(resultat_mca$eig$eigenvalue[2], 3)), "; ", gcomma(round(resultat_mca$eig$`modified rates`[2], 1)) ,"%)")) +
  scale_x_continuous(labels = gcomma) +
  scale_y_continuous(labels = gcomma)

plot_mca_ellipsen
ggsave("dgfe_mca_ellipsen.pdf", plot_mca_ellipsen, height = 8, width = 9)

plot_mca_kontur <- plot_mca + 
  geom_density2d(data = resultat_mca$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.75, colour = "gray") +
  geom_label(data = koordinaten_ind_ellipsen_mittelwert_anzahl, aes(Dim.1, Dim.2, label = paste0("Profil ", clust ,": ", size, "%")), family = "Myriad Pro", size = 5) 

plot_mca_kontur
ggsave("dgfe_mca_kontur.pdf", plot_mca_kontur, height = 8, width = 9)
