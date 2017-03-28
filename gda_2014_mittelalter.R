# Pakete laden
pacman::p_load(TimeSpaceAnalysis)

# Repository laden
source("repository.R")
source("survey_951135_R_syntax_file.R")

# Datensatz laden
loadFromLocalRepo(names(asearch("name:datensatz_synthesise_users_2014_mittelalter")))

# Datensatz aufbereiten


# PCA berechnen
datensatz_synthesise_users_gda <- datensatz_synthesise_users_2014_mittelalter %>% select(
  # Häufigkeit Pause
  visit_video_event_actions_pause_mittelalter,
  # Häufigkeit Springen
  visit_video_event_actions_jump_mittelalter,
  # Häufigkeit Abspielen
  visit_video_event_actions_play_mittelalter,
  # Häufigkeit Geschwindigkeit
  visit_video_event_actions_speed_mittelalter,
  # Gesamtzeit aller Aktionen
  visit_video_event_actions_duration_mittelalter
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


Online.Lektionen.Speziell <- c(
  "Sozialgeschichte der Erziehung und Bildung",
  "Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)",
  "Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)",
  "Erziehung und Schule",
  "Bildung, Glück und Gerechtigkeit",
  "Sozialgeschichte der Erziehung und Bildung",
  "Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)",
  "Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)",
  "Erziehung und Schule",
  "Bildung, Glück und Gerechtigkeit",
  "Sozialgeschichte der Erziehung und Bildung",
  "Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)",
  "Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)",
  "Erziehung und Schule",
  "Bildung, Glück und Gerechtigkeit",
  "Sozialgeschichte der Erziehung und Bildung",
  "Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)",
  "Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)",
  "Erziehung und Schule",
  "Bildung, Glück und Gerechtigkeit",
  "Sozialgeschichte der Erziehung und Bildung",
  "Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)",
  "Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)",
  "Erziehung und Schule",
  "Bildung, Glück und Gerechtigkeit"
)

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
         online_lektionen_intensiver_gelernt = G4Q00001_4,
         mittelalter_gestaltung = G4Q00002_1, 
         mittelalter_inhaltlicher_einblick = G4Q00003_1,
         mittelalter_anspruchsvoll = G4Q00004_1,
         mittelalter_strukturiert = G4Q00005_1,
         mittelalter_umfang_angemessen = G4Q00006_1) %>% 
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
                                                     "online-Lektionen mehr gelernt: sehr" = "trifft voll zu"),
    mittelalter_gestaltung = fct_recode(mittelalter_gestaltung,
                                                     "online-Lektion gut gestaltet: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektion gut gestaltet: kaum" = "trifft kaum zu",
                                                     "online-Lektion gut gestaltet: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektion gut gestaltet: teilweise" = "trifft teilweise zu",
                                                     "online-Lektion gut gestaltet: sehr" = "trifft weitgehend zu",
                                                     "online-Lektion gut gestaltet: sehr" = "trifft voll zu"),
    mittelalter_inhaltlicher_einblick = fct_recode(mittelalter_inhaltlicher_einblick,
                                                     "online-Lektion inhaltlicher Einblick: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektion inhaltlicher Einblick: kaum" = "trifft kaum zu",
                                                     "online-Lektion inhaltlicher Einblick: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektion inhaltlicher Einblick: teilweise" = "trifft teilweise zu",
                                                     "online-Lektion inhaltlicher Einblick: sehr" = "trifft weitgehend zu",
                                                     "online-Lektion inhaltlicher Einblick: sehr" = "trifft voll zu"),
    mittelalter_anspruchsvoll = fct_recode(mittelalter_anspruchsvoll,
                                                     "online-Lektion anspruchsvoll: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektion anspruchsvoll: kaum" = "trifft kaum zu",
                                                     "online-Lektion anspruchsvoll: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektion anspruchsvoll: teilweise" = "trifft teilweise zu",
                                                     "online-Lektion anspruchsvoll: sehr" = "trifft weitgehend zu",
                                                     "online-Lektion anspruchsvoll: sehr" = "trifft voll zu"),
    mittelalter_strukturiert = fct_recode(mittelalter_strukturiert,
                                                     "online-Lektion strukturiert: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektion strukturiert: kaum" = "trifft kaum zu",
                                                     "online-Lektion strukturiert: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektion strukturiert: teilweise" = "trifft teilweise zu",
                                                     "online-Lektion strukturiert: sehr" = "trifft weitgehend zu",
                                                     "online-Lektion strukturiert: sehr" = "trifft voll zu"),
    mittelalter_umfang_angemessen = fct_recode(mittelalter_umfang_angemessen,
                                                     "online-Lektion angemessener Umfang: kaum" = "trifft überhaupt nicht zu",
                                                     "online-Lektion angemessener Umfang: kaum" = "trifft kaum zu",
                                                     "online-Lektion angemessener Umfang: teilweise" = "trifft teilweise nicht zu",
                                                     "online-Lektion angemessener Umfang: teilweise" = "trifft teilweise zu",
                                                     "online-Lektion angemessener Umfang: sehr" = "trifft weitgehend zu",
                                                     "online-Lektion angemessener Umfang: sehr" = "trifft voll zu")
    
  )
# survey_data %>% View


# Daten zusammenstellen

final_data <- full_join(datensatz_synthesise_users_gda, survey_data)
View(final_data)

# PCA: Interaktionen aktiv, Bewertungen passiv ----------------------------

pca_res <- PCA(final_data[,c(1:5, 21:25)], quali.sup = 6:10, quanti.sup = 4)

plot.PCA(pca_res, choix = "ind", invisible = "ind")


# MCA: Bewertungen aktiv, Interaktionen passiv ----------------------------

getindexcat(na.omit(final_data[,-c(1:5, 6:20)]))

res_mca <- MCA(na.omit(final_data[,-c(4, 6:20)]), quanti.sup = 1:4, graph = FALSE, excl = c(1, 4, 7, 10, 13))

fviz_eig(res_mca)

modif.rate(res_mca)

fviz_mca_ind(res_mca)

fviz_gda_var(res_mca, contrib = 1000, title = "")

fviz_gda_conc_ellipse(res_mca, title = "")
ggsave("Metrisch.png", width = 8, height = 5)

fviz_mca_var(res_mca, choice = "quanti.sup", repel = TRUE, col.quanti.sup = "darkgreen") + 
  xlab(paste0("Achse 1 (", modif.rate(res_mca)[1,1], "%)")) + 
  ylab(paste0("Achse 2 (", modif.rate(res_mca)[2,1], "%)")) + 
  ggtitle("") + xlim(-0.2,0.2) + ylim(-0.2,0.2) + add_theme()

res_hcpc_mca <- HCPC(res_mca, nb.clust = 3, graph = FALSE)

fviz_gda_quali_ellipses(res_mca, data.frame(res_hcpc_mca$data.clust), "clust", title = "")


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
