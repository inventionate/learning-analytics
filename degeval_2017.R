# DeGEval Tagung 2017 Wien
#-----------------------------------------------------------------------#
# Umgabung vorbereiten
#-----------------------------------------------------------------------#
# Pakete laden
pacman::p_load(TimeSpaceAnalysis, questionr)
# Repository laden
source("repository.R")
source("survey_951135_R_syntax_file.R")
# Datensatz laden
loadFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014")))
benutzer <- read_csv2("visitors_2014.csv")
#-----------------------------------------------------------------------#
# Datensatz Learning Analytics
#-----------------------------------------------------------------------#

# Interaktionen auslesen
datensatz_benutzer_allgemein <- benutzer %>% select(
  visitorId, 
  userId, 
  visitorType, 
  events, 
  actions, 
  visitDuration) %>%
  filter( !is.na(userId) )

datensatz_interaktionen_durchschnittlich <- datensatz_benutzer_allgemein %>% 
  select(-visitorType) %>%
  group_by(visitorId, userId) %>%
  summarise_all(funs(mean)) %>%
  ungroup() %>%
  select(-visitorId) %>%
  rename(
    user_id = userId,
    events_average = events,
    actions_average = actions,
    visit_duration_average = visitDuration)

datensatz_interaktionen_total <- datensatz_benutzer_allgemein %>% 
  select(-visitorType) %>%
  group_by(visitorId, userId) %>%
  summarise_all(funs(sum)) %>%
  ungroup() %>%
  select(-visitorId) %>%
  rename(
    user_id = userId,
    events_total = events,
    actions_total = actions,
    visit_duration_total = visitDuration)

# Datensatz zusammenstellen
datensatz_learning_analytics <- full_join(datensatz_interaktionen_durchschnittlich, datensatz_interaktionen_total)
datensatz_learning_analytics

#-----------------------------------------------------------------------#
# Datensatz online-Umfrage
#-----------------------------------------------------------------------#
# LimeSurvey zusammenstellen
datensatz_limesurvey <- data %>% mutate(user_id = stringr::str_sub(refurl, start = 70)) %>% 
  select(user_id, 
         eigenverantwortliches_lernen = G1Q00001_2,
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
datensatz_final <- full_join(datensatz_learning_analytics, datensatz_limesurvey) %>%
  select(-user_id) %>%
  rownames_to_column(var = "questionnaire_id") %>%
  gda_optimise_df %>%
  mutate_at(1:6, funs(as.numeric(as.character(.)))) %>%
  mutate(
    mentoren_inhaltlich_hilfe = forcats::fct_recode(
      mentoren_inhaltlich_hilfe,
      "Mentoren inhaltliche Hilfe: teilweise" = "Mentoren inhaltliche Hilfe: kaum",
      NULL = "mentoren_inhaltlich_hilfe_Fehlender Wert"
    ),
    mentoren_tandem = forcats::fct_recode(
      mentoren_tandem,
      "Mentoren Tandem: teilweise" = "Mentoren Tandem: kaum",
      NULL = "mentoren_tandem_Fehlender Wert"
    ),
    mentoren_studium_hilfe = forcats::fct_recode(
      mentoren_studium_hilfe,
      "Mentoren Studium Hilfe: teilweise" = "Mentoren Studium Hilfe: kaum",
      NULL = "mentoren_studium_hilfe_Fehlender Wert"
    ),
    mentoren_wiss_arbeit = forcats::fct_recode(
      mentoren_wiss_arbeit,
      NULL = "mentoren_wiss_arbeit_Fehlender Wert"
    ),
    reflexion = forcats::fct_recode(
      reflexion,
      NULL = "reflexion_Fehlender Wert"
    ),
    online_lektionen_bevorzugt = forcats::fct_recode(
      online_lektionen_bevorzugt,
      NULL = "online_lektionen_bevorzugt_Fehlender Wert"
    ),
    verfuegbarkeit_vevorzugt = forcats::fct_recode(
      verfuegbarkeit_vevorzugt,
      NULL = "verfuegbarkeit_vevorzugt_Fehlender Wert"
    ),
    online_lektionen_intensiver_gelernt = forcats::fct_recode(
      online_lektionen_intensiver_gelernt,
      NULL = "online_lektionen_intensiver_gelernt_Fehlender Wert"
    ),
    unabhaengigkeit_fester_termine = forcats::fct_recode(
      unabhaengigkeit_fester_termine,
      NULL = "unabhaengigkeit_fester_termine_Fehlender Wert"
    )) %>%
  as_tibble
datensatz_final

# Imputation
datensatz_final_imputiert <-imputeMFA(datensatz_final[-12,], group = c(6, 15), type = c("s", "n"))

# spMFA berechnen
resultat_mfa <- MFA(datensatz_final[-12,], group = c(6, 15), type = c("s", "n"), name.group = c("Learning Analytics", "online-Umfrage"), graph = FALSE, tab.comp = datensatz_final_imputiert)

# Grafiken
fviz_mfa_axes(resultat_mfa) + theme(legend.position = "none")
fviz_mfa_var(resultat_mfa, choice = "quanti.var", repel = TRUE) + theme_bw() + ggtitle("Learning Analytics (Korrelation der Variablen)") + theme(legend.position = "none", title = element_text(face = "bold"))
ggsave("mfa_quanti.pdf", width = 6, height = 6)
fviz_mfa_var(resultat_mfa, choice = "quali.var", repel = TRUE) + theme_bw() + ggtitle("online-Umfrage (Kovarianz der Kategorien)") + theme(legend.position = "none", title = element_text(face = "bold"))
ggsave("mfa_quali.pdf", width = 8, height = 8)
fviz_mfa_var(resultat_mfa, choice = "group")
fviz_mfa_ind(resultat_mfa, geom = "point", col.ind = "black") + theme_bw() + ggtitle("Gesamtanalyse (Position der Studierenden)") + theme(legend.position = "none", title = element_text(face = "bold"))
ggsave("mfa_ind.pdf")
fviz_mfa_ind(resultat_mfa, partial = "All", geom = "point") + theme_bw() + ggtitle("Position der Studierenden: Learning Analytics (rot) und online-Umfrage (türkis)") + theme(legend.position = "none", title = element_text(face = "bold"))
ggsave("mfa_ind_partial.pdf", width = 7.5, height = 5)

# HCPC berechnen
resultat_hcpc <- HCPC(resultat_mfa, nb.clust = 3, graph = FALSE)

# Grafiken
fviz_cluster(resultat_hcpc, geom = "point") + 
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_vline(xintercept = 0, linetype = "dashed") +
  theme_bw() + ggtitle("Gruppierung der Position der Studierenden (Clusteranalyse)") + 
  theme(legend.position = "none", title = element_text(face = "bold"))
ggsave("mfa_cluster.pdf")
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
supvar_stats(resultat_mfa, resultat_hcpc$data.clust, "clust")


#-----------------------------------------------------------------------#
# Klassische Alternativen
#-----------------------------------------------------------------------#

# PCA berechnen
resultat_pca <- PCA(datensatz_final, quali.sup = 6:20, graph = FALSE, scale.unit = TRUE)

fviz_pca_ind(resultat_pca)
fviz_pca_var(resultat_pca)

# spMCA modern berechnen
# Passive Kategorien
# Mentoren inhaltliche Hilfe: kaum (7, 0.045) — 4
# Mentoren Tandem: kaum (9, 0.057) — 7
# Mentoren Studium Hilfe: kaum (5, 0.033) — 10
getindexcat(datensatz_final[,-c(1:5)] %>% data.frame)

resultat_mca <- MCA(datensatz_final, quanti.sup = 1:5, graph = FALSE, excl = c(4, 7, 10))

fviz_mca_ind(resultat_mca)
fviz_mca_var(resultat_mca)
fviz_mca_var(resultat_mca, choice = "quanti.sup") + xlim(-0.2,0.2) + ylim(-0.2,0.2)

# spMCA ohne ergänzende Variablen mit Kategorisierungen
datensatz_interaktionen_kategorien <- datensatz_synthesise_users_2014 %>%
  transmute(
    # Gesamtzeit auf der App
    total_visit_duration = quant.cut(round(total_visit_duration/60/60, 2), 4, labels = c("Besuchszeit: sehr kurz", "Besuchszeit: kurz", "Besuchszeit: lang", "Besuchszeit: sehr lang")),
    # Durchschnittliche Besuchszeit
    average_visit_duration = quant.cut(as.numeric(average_visit_duration), 4, labels = c("Durchschnittliche Besuchszeit: sehr kurz", "Durchschnittliche Besuchszeit: kurz", "Durchschnittliche Besuchszeit: lang", "Durchschnittliche Besuchszeit: sehr lang")),
    # Gesamtzahl Besuche
    total_visits = quant.cut(as.numeric(total_visits), 4, labels = c("Gesamtbesuche: sehr wenige", "Gesamtbesuche: wenige", "Gesamtbesuche: viele", "Gesamtbesuche: sehr viele")),
    # Gesamtzahl Aktionen (Klicks etc.)
    total_actions = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtaktionen: sehr wenige", "Gesamtaktionen: wenige", "Gesamtaktionen: viele", "Gesamtaktionen: sehr viele")),
    # Gesamtzahl Interaktionen (Abspielungen etc.)
    total_events = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtevents: sehr wenige", "Gesamtevents: wenige", "Gesamtevents: viele", "Gesamtevents: sehr viele")),
    # Häufigster Besuchstag
    frequently_visit_day = as_factor(frequently_visit_day)
    ) %>%
  mutate_all(funs(as.factor)) %>%
  as_tibble
datensatz_interaktionen_kategorien %>% describe

# Datensatz zusammenstellen
datensatz_learning_analytics_kategorien <- bind_cols(datensatz_interaktionen_kategorien, data.frame(user_id = user_id))

# Datensatz zusammenstellen
datensatz_final_kategorien <- full_join(datensatz_learning_analytics_kategorien, datensatz_limesurvey) %>%
  select(-user_id) %>% drop_na
datensatz_final_kategorien

# spMCA berechnen
# Mentoren inhaltliche Hilfe: kaum (7, 0.045) — 4
# Mentoren Tandem: kaum (9, 0.057) — 7
# Mentoren Studium Hilfe: kaum (5, 0.033) — 10
# Zeiten sehr kurz anders poolen oder ausschließen.
# getindexcat(datensatz_final_kategorien %>% data.frame)

resultat_mca_kategorien <- MCA(datensatz_final_kategorien, graph = FALSE, excl = c(1, 5, 9, 13, 17, 31, 34, 37))

fviz_eig(resultat_mca_kategorien)
modif.rate(resultat_mca_kategorien)

fviz_gda_conc_ellipse(resultat_mca_kategorien)
fviz_gda_var_axis(resultat_mca_kategorien, group = c(6, 15), group_names = c("Learning Analytics", "online-Befragung"), axis = 1)
fviz_gda_var_axis(resultat_mca_kategorien, group = c(6, 15), group_names = c("Learning Analytics", "online-Befragung"), axis = 2)

resultat_hcpc_kategorien <- HCPC(resultat_mca_kategorien, nb.clust = 3, graph = FALSE)

fviz_cluster(resultat_hcpc_kategorien) + add_theme()

