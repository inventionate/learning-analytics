# Pakete laden
pacman::p_load(TimeSpaceAnalysis)

# Repository laden
source("repository.R")

# Datensatz laden
loadFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014")))

# Datensatz aufbereiten


# PCA berechnen
datensatz_synthesise_users_gda <- datensatz_synthesise_users_2014 %>% select(
  # Gesamtzeit auf der App
  total_visit_duration,
  # Durchschnittliche Besuchszeit
  average_visit_duration,
  # Gesamtzahl Besuche
  total_visits,
  # Gesamtzahl Aktionen (Klicks etc.)
  total_actions,
  # Gesamtzahl Interaktionen (Abspielungen etc.)
  total_events,
  # Häufigster Besuchstag
  # frequently_visit_day = as_factor(frequently_visit_day),
  # Häufigste Besuchsuhrzeit
  # frequently_visit_hour = as.factor(frequently_visit_hour),
  # Häufigster Besuchsort
  # frequently_visit_city = as.factor(frequently_visit_city),
  # Häufigstes Besuchsgerät
  # frequently_visit_devices = as_factor(frequently_visit_devices),
  # Durchschnittliche Interaktionen (Abspielungen etc.)
  average_visit_events,
  # Häufigkeit Notizfunktion
  visit_event_action_notes,
  # Häufigkeit Videos allgemein
  visit_event_action_videos,
  # Häufigkeit Pause
  visit_video_event_actions_pause,
  # Häufigkeit Springen
  visit_video_event_actions_jump,
  # Häufigkeit Fähnchen
  visit_video_event_actions_cuepoint,
  # Häufigkeit Abspielen
  visit_video_event_actions_play,
  # Häufigkeit Geschwindigkeit
  visit_video_event_actions_speed
) %>% 
  mutate_all(funs(as.numeric)) %>% data.frame

# Benutzer ID hinzufügen
benutzer <- read_csv2("visitors_2014.csv")

benutzer_data <- benutzer %>% select(
  visitorId, 
  userId, 
  visitorType, 
  events, 
  actions, 
  visitDuration) %>%
  filter( !is.na(userId) )

user_id <- benutzer_data %>% select(visitorId, userId) %>% distinct %>% .$userId

datensatz_synthesise_users_gda <- bind_cols(datensatz_synthesise_users_gda, data.frame(user_id = user_id))

# LimeSurvey integrieren

survey_data <- data %>% mutate(user_id = stringr::str_sub(refurl, start = 70)) %>% 
  select(user_id, 
         bestandteile_ergaenzen_sich = G1Q00001_1,
         eigenverantwortliches_lernen = G1Q00001_2,
         dozenten_haufiger = G1Q00001_3,
         mentoren_inhaltlich_hilfe = G1Q00001_4,
         mentoren_tandem = G1Q00001_5,
         mentoren_studium_hilfe = G1Q00001_6,
         lernzuwachs = G1Q00001_7,
         mentoren_wiss_arbeit = G1Q00001_8,
         reflexion = G1Q00001_9,
         klausur_anreiz = G1Q00001_10,
         erziehungswissenschaft = G1Q00001_11,
         organisation = G1Q00001_12,
         online_lektionen_bevorzugt = G4Q00001_1,
         online_lektionen_intensiver_gelernt = G4Q00001_4) %>% 
  mutate(
    bestandteile_ergaenzen_sich = fct_recode(bestandteile_ergaenzen_sich,
      "Ergänzung: kaum" = "trifft überhaupt nicht zu",
      "Ergänzung: kaum" = "trifft kaum zu",
      "Ergänzung: teilweise" = "trifft teilweise nicht zu",
      "Ergänzung: teilweise" = "trifft teilweise zu",
      "Ergänzung: sehr" = "trifft weitgehend zu",
      "Ergänzung: sehr" = "trifft voll zu"),
    eigenverantwortliches_lernen = fct_recode(eigenverantwortliches_lernen,
                                             "Eigenverantwortliches Lernen: kaum" = "trifft überhaupt nicht zu",
                                             "Eigenverantwortliches Lernen: kaum" = "trifft kaum zu",
                                             "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise nicht zu",
                                             "Eigenverantwortliches Lernen: teilweise" = "trifft teilweise zu",
                                             "Eigenverantwortliches Lernen: sehr" = "trifft weitgehend zu",
                                             "Eigenverantwortliches Lernen: sehr" = "trifft voll zu"),
    dozenten_haufiger = fct_recode(dozenten_haufiger,
                                             "Dozent häufiger: kaum" = "trifft überhaupt nicht zu",
                                             "Dozent häufiger: kaum" = "trifft kaum zu",
                                             "Dozent häufiger: teilweise" = "trifft teilweise nicht zu",
                                             "Dozent häufiger: teilweise" = "trifft teilweise zu",
                                             "Dozent häufiger: sehr" = "trifft weitgehend zu",
                                             "Dozent häufiger: sehr" = "trifft voll zu"),
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
    lernzuwachs = fct_recode(lernzuwachs,
                                 "Lernzuwachs: kaum" = "trifft überhaupt nicht zu",
                                 "Lernzuwachs: kaum" = "trifft kaum zu",
                                 "Lernzuwachs: teilweise" = "trifft teilweise nicht zu",
                                 "Lernzuwachs: teilweise" = "trifft teilweise zu",
                                 "Lernzuwachs: sehr" = "trifft weitgehend zu",
                                 "Lernzuwachs: sehr" = "trifft voll zu"),
    mentoren_wiss_arbeit = fct_recode(mentoren_wiss_arbeit,
                             "Mentoren wiss. Arbeiten: kaum" = "trifft überhaupt nicht zu",
                             "Mentoren wiss. Arbeiten: kaum" = "trifft kaum zu",
                             "Mentoren wiss. Arbeiten: teilweise" = "trifft teilweise nicht zu",
                             "Mentoren wiss. Arbeiten: teilweise" = "trifft teilweise zu",
                             "Mentoren wiss. Arbeiten: sehr" = "trifft weitgehend zu",
                             "Mentoren wiss. Arbeiten: sehr" = "trifft voll zu"),
    reflexion = fct_recode(reflexion,
                             "Reflexionszuwachs: kaum" = "trifft überhaupt nicht zu",
                             "Reflexionszuwachs: kaum" = "trifft kaum zu",
                             "Reflexionszuwachs: teilweise" = "trifft teilweise nicht zu",
                             "Reflexionszuwachs: teilweise" = "trifft teilweise zu",
                             "Reflexionszuwachs: sehr" = "trifft weitgehend zu",
                             "Reflexionszuwachs: sehr" = "trifft voll zu"),
    klausur_anreiz = fct_recode(klausur_anreiz,
                           "Klausur als Anreiz: kaum" = "trifft überhaupt nicht zu",
                           "Klausur als Anreiz: kaum" = "trifft kaum zu",
                           "Klausur als Anreiz: teilweise" = "trifft teilweise nicht zu",
                           "Klausur als Anreiz: teilweise" = "trifft teilweise zu",
                           "Klausur als Anreiz: sehr" = "trifft weitgehend zu",
                           "Klausur als Anreiz: sehr" = "trifft voll zu"),
    erziehungswissenschaft = fct_recode(erziehungswissenschaft,
                                             "Interesse Erziehungswiss.: kaum" = "trifft überhaupt nicht zu",
                                             "Interesse Erziehungswiss.: kaum" = "trifft kaum zu",
                                             "Interesse Erziehungswiss.: teilweise" = "trifft teilweise nicht zu",
                                             "Interesse Erziehungswiss.: teilweise" = "trifft teilweise zu",
                                             "Interesse Erziehungswiss.: sehr" = "trifft weitgehend zu",
                                             "Interesse Erziehungswiss.: sehr" = "trifft voll zu"),
    organisation = fct_recode(organisation,
                             "Organisation gelungen: kaum" = "trifft überhaupt nicht zu",
                             "Organisation gelungen: kaum" = "trifft kaum zu",
                             "Organisation gelungen: teilweise" = "trifft teilweise nicht zu",
                             "Organisation gelungen: teilweise" = "trifft teilweise zu",
                             "Organisation gelungen: sehr" = "trifft weitgehend zu",
                             "Organisation gelungen: sehr" = "trifft voll zu"),
    online_lektionen_bevorzugt = fct_recode(online_lektionen_bevorzugt,
                             "online-Lektionen bevorzugt: kaum" = "trifft überhaupt nicht zu",
                             "online-Lektionen bevorzugt: kaum" = "trifft kaum zu",
                             "online-Lektionen bevorzugt: teilweise" = "trifft teilweise nicht zu",
                             "online-Lektionen bevorzugt: teilweise" = "trifft teilweise zu",
                             "online-Lektionen bevorzugt: sehr" = "trifft weitgehend zu",
                             "online-Lektionen bevorzugt: sehr" = "trifft voll zu"),
    online_lektionen_intensiver_gelernt = fct_recode(online_lektionen_intensiver_gelernt,
                             "online-Lektionen mehr gelernt: kaum" = "trifft überhaupt nicht zu",
                             "online-Lektionen mehr gelernt: kaum" = "trifft kaum zu",
                             "online-Lektionen mehr gelernt: teilweise" = "trifft teilweise nicht zu",
                             "online-Lektionen mehr gelernt: teilweise" = "trifft teilweise zu",
                             "online-Lektionen mehr gelernt: sehr" = "trifft weitgehend zu",
                             "online-Lektionen mehr gelernt: sehr" = "trifft voll zu")
  )
# survey_data %>% View


# Daten zusammenstellen

final_data <- full_join(datensatz_synthesise_users_gda, survey_data)
View(final_data)

nrow(na.omit(final_data[,-c(1:14)]))


# MCA: Bewertungen aktiv, Interaktionen passiv ----------------------------

impute_gda <- imputeMCA(final_data[,-c(1:14)])
# getindexcat(final_data[, -c(1:14)])


mca_data <- final_data %>% select(-user_id, -visit_event_action_notes, -average_visit_events, -visit_video_event_actions_speed, -visit_video_event_actions_pause, -visit_video_event_actions_play, -total_actions, -average_visit_duration, -total_events)# %>%
  #mutate(total_visit_duration = quant.cut(round(total_visit_duration/60/60, 2), 4, labels = c("Besuchszeit: sehr kurz", "Besuchszeit: kurz", "Besuchszeit: lang", "Besuchszeit: sehr lang")))
  
  
res_mca <- MCA(na.omit(mca_data), quanti.sup = 1:5, graph = FALSE, excl = c(1, 10, 13, 16))

fviz_eig(res_mca)

modif.rate(res_mca)

fviz_mca_ind(res_mca)

fviz_mca_var(res_mca)

fviz_mca_var(res_mca, choice = "quanti.sup", repel = TRUE)# + xlim(-0.25,0.25) + ylim(-0.25,0.25)

res_hcpc_mca <- HCPC(res_mca, nb.clust = 3, graph = FALSE)

fviz_gda_quali_ellipses(res_mca, data.frame(res_hcpc_mca$data.clust), "clust")


# PCA: Interaktionen aktiv, Bewertungen passiv ----------------------------


# Imputieren
impute_gda <- imputePCA(final_data %>% select(-user_id, -bestandteile_ergaenzen_sich, -dozenten_haufiger, -erziehungswissenschaft))

final_gda_data <- bind_cols(data.frame(impute_gda$completeObs), data.frame(bestandteile_ergaenzen_sich = final_data$bestandteile_ergaenzen_sich, dozenten_haufiger = final_data$dozenten_haufiger, erziehungswissenschaft = final_data$erziehungswissenschaft) )
final_gda_data %>% View
# PCA
res_pca <- PCA(final_gda_data, quali.sup = 12:14, ind.sup = c(363, 25, 78, 26, 377, 11, 423, 332, 150), graph = FALSE)

# Plot selbst basteln
## Bestehend aus aktiven Individuen und kategorialen illustrativen Variablen

fviz_pca_var(res_pca)

res_hcpc <- HCPC(res_pca, nb.clust = 4, graph = FALSE)

data_clust <- data.frame(res_pca$ind$coord, cluster = res_hcpc$data.clust$clust)

ggplot(data_clust, aes(Dim.1, Dim.2, group = cluster, colour = cluster)) +
  geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
  geom_point() +
  stat_ellipse() +
  theme_few()


ggplot(res_pca$quali.sup$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), sep =":", remove = FALSE), aes(Dim.1, Dim.2, label = rowname, group = var, colour = var)) +
  geom_hline(yintercept = 0) + geom_vline(xintercept = 0) +
  geom_point(shape = 17, size = 3, show.legend = FALSE) +
  geom_text_repel(show.legend = FALSE) +
  geom_path(linetype = "dashed", show.legend = FALSE) +
  theme_few() + xlim(-1, 2) + ylim(-1, 1)






# factoextra
fviz_pca_ind(res_pca, col.ind.sup = "gray")

fviz_pca_ind(res_pca, habillage = 12:14, addEllipses = TRUE, alpha.ind = 0.1)

fviz_pca_var(res_pca)

fviz_pca_biplot(res_pca)
