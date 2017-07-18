# Pakete laden
pacman::p_load(TimeSpaceAnalysis, questionr, rgl)

# Repository laden
source("repository.R")

# Datensatz laden
loadFromLocalRepo(names(asearch("name:datensatz_synthesise_users_mathe")))

# Datensatz aufbereiten
datensatz_synthesise_users_gda <- datensatz_synthesise_users_mathe %>%
  transmute(
    # Gesamtzeit auf der App
    total_visit_duration = quant.cut(round(total_visit_duration/60/60, 2), 4, labels = c("Besuchszeit: very short", "Besuchszeit: short", "Besuchszeit: long", "Besuchszeit: very long")),
    # Durchschnittliche Besuchszeit
    average_visit_duration = quant.cut(as.numeric(average_visit_duration), 4, labels = c("Durchschnittliche Besuchszeit: very short", "Durchschnittliche Besuchszeit: short", "Durchschnittliche Besuchszeit: long", "Durchschnittliche Besuchszeit: very long")),
    # Gesamtzahl Besuche
    total_visits = quant.cut(as.numeric(total_visits), 4, labels = c("Gesamtbesuche: very few", "Gesamtbesuche: few", "Gesamtbesuche: many", "Gesamtbesuche: very many")),
    # Gesamtzahl Aktionen (Klicks etc.)
    total_actions = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtaktionen: very few", "Gesamtaktionen: few", "Gesamtaktionen: many", "Gesamtaktionen: very many")),
    # Gesamtzahl Interaktionen (Abspielungen etc.)
    total_events = quant.cut(as.numeric(total_actions), 4, labels = c("Gesamtevents: very few", "Gesamtevents: few", "Gesamtevents: many", "Gesamtevents: very many")),
    # Häufigster Besuchstag
    frequently_visit_day = as_factor(frequently_visit_day),
    # Häufigste Besuchsuhrzeit
    frequently_visit_hour = as.factor(frequently_visit_hour),
    # Häufigster Besuchsort
    frequently_visit_city = as.factor(frequently_visit_city),
    # Häufigstes Besuchsgerät
    frequently_visit_devices = as_factor(frequently_visit_devices),
    # Durchschnittliche Interaktionen (Abspielungen etc.)
    average_visit_events = quant.cut(as.numeric(average_visit_events), 4, labels = c("Durchschnittliche Events: very few", "Durchschnittliche Events: few", "Durchschnittliche Events: many", "Durchschnittliche Events: very many")),
    # Häufigkeit Notizfunktion
    visit_event_action_notes = quant.cut(as.numeric(visit_event_action_notes), 4, labels = c("Notizen: very few", "Notizen: few", "Notizen: many", "Notizen: very many")),
    # Häufigkeit Videos allgemein
    visit_event_action_videos = quant.cut(as.numeric(visit_event_action_videos), 4, labels = c("Videoaktivitäten: very few", "Videoaktivitäten: few", "Videoaktivitäten: many", "Videoaktivitäten: very many")),
    # Häufigkeit Pause
    visit_video_event_actions_pause = quant.cut(as.numeric(visit_video_event_actions_pause), 4, labels = c("Pausen: very few", "Pausen: few", "Pausen: many", "Pausen: very many")),
    # Häufigkeit Springen
    visit_video_event_actions_jump = quant.cut(as.numeric(visit_video_event_actions_jump), 4, labels = c("Sprünge: very few", "Sprünge: few", "Sprünge: many", "Sprünge: very many")),
    # Häufigkeit Fähnchen
    visit_video_event_actions_cuepoint = quant.cut(as.numeric(visit_video_event_actions_cuepoint), 4, labels = c("Fähnchensprünge: very few", "Fähnchensprünge: few", "Fähnchensprünge: many", "Fähnchensprünge: very many")),
    # Häufigkeit Abspielen
    visit_video_event_actions_play = quant.cut(as.numeric(visit_video_event_actions_play), 4, labels = c("Abspielungen: very few", "Abspielungen: few", "Abspielungen: many", "Abspielungen: very many")),
    # Häufigkeit Geschwindigkeit
    visit_video_event_actions_speed = quant.cut(as.numeric(visit_video_event_actions_speed), 4,  labels = c("Geschwindigkeitsveränderungen: very few", "Geschwindigkeitsveränderungen: few", "Geschwindigkeitsveränderungen: many", "Geschwindigkeitsveränderungen: very many"))) %>%
  mutate_all(funs(as.factor)) %>%
  data.frame
  
# Imputation
# Notizen ausschließen, da very many NA -> passiv setzen!
datensatz_synthesise_users_gda_impute <- imputeMCA(datensatz_synthesise_users_gda[,-c(6:9, 11)])

# MCA berechnen
mca_res <- MCA(datensatz_synthesise_users_gda[,-c(6:9, 11)], tab.disj = datensatz_synthesise_users_gda_impute$tab.disj, graph = FALSE)

# Eigenwerte untersuchen -> drei Dimensionen!
fviz_eig(mca_res)
ggsave("eigenwerte.pdf")

# Gruppierung nach "total" und "durchschnittlich", "aktionen"
group = c(2, 5, 5)
group_names = c("Duration", "Web-app interactions", "Video interactions")

gda_describe_group(mca_res, group, group_names)


# Aufgeklärte Varianz betrachten -> bei drei Dimensionen sind das 98.43%
modif.rate(mca_res)[1:3,]

# Ebene konstruieren

## Individuen
coord_ind <- tibble(x = mca_res$ind$coord[,1], y = mca_res$ind$coord[, 2]) %>%
  group_by(x, y) %>%
  mutate(count = n()) %>%
  ungroup()
ggplot(coord_ind, aes(x, y)) +
  geom_point(aes(alpha = count), show.legend = FALSE) +
  # scale_size(range = c(min(coord_ind$count), max(max(coord_ind$count)))) +
  scale_alpha(range = c(0.5, 1)) +
  geom_density_2d(colour = "gray") +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz."))# + xlim(-1.8, 1.3) + ylim(-1.1, 1.6)
ggsave("1 Individuen.pdf", width = 11, height = 8)

## Nur eine Variable
weights <- mca_res$call$X$visit_video_event_actions_play %>% na.omit() %>% fct_count %>% .$n/5

ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":") %>% filter(var == "Abspielungen"), aes(Dim.1, Dim.2)) + 
  geom_path(linetype = "dashed", size = 1.25) +
  geom_point(shape = 17, aes(size = weights), show.legend = FALSE) +
  scale_size(range = c(min(weights), max(weights))) + 
  geom_text_repel(aes(label = rowname), point.padding = unit(0.25, "lines")) +
  geom_point(data = coord_ind, aes(x, y, alpha = count), show.legend = FALSE) +
  scale_alpha(range = c(0.4, 0.9)) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.6)
ggsave("2 Ebene 1.pdf", width = 11, height = 8)

## Durchschnittliche Pfade nach Gruppen

# Übersicht der Skalen für die Variablen!
levels <- datensatz_synthesise_users_gda[,-c(6:9, 11)] %>% mutate_all(as.factor) %>% 
  summarise_all(funs(nlevels))
# Daten aufbereiten
daten <- mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":") %>%
  bind_cols(., data.frame(gruppen = rep(rep(group_names, group), levels))) %>%
  group_by(gruppen, cat) %>% summarise_at(vars(matches("Dim.")), funs(mean)) %>%
  unite(var, gruppen, cat, sep = ":", remove = FALSE) %>% 
  ungroup() %>%
  mutate(
    var = fct_relevel(as_factor(var), 
                      "Duration: very long", 
                      "Duration: long",
                      "Duration: short", 
                      "Duration: very short",
                      "Web-app interactions: very many",
                      "Web-app interactions: many",
                      "Web-app interactions: few",
                      "Web-app interactions: very few",
                      "Video interactions: very many",
                      "Video interactions: many",         
                      "Video interactions: few",
                      "Video interactions: very few")
  ) %>%
  arrange(var)
ggplot(daten, aes(Dim.1, Dim.2, group = gruppen, label = cat, colour = gruppen)) + 
  geom_path(aes(linetype = gruppen), size = 1.25, show.legend = TRUE) +
  geom_point(shape = 17, size = 4, show.legend = FALSE) +
  geom_text_repel(point.padding = unit(0.25, "lines"), show.legend = FALSE, size = 10) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 3, inherit.aes = FALSE) +
  theme_bw() + ylab("") + xlab(paste0("The plane explains ", modif.rate(mca_res)[2,2], "% variance.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.6) +
  theme(axis.text = element_text(size = 17), axis.title.x = element_text(size = 22), 
        legend.position = "bottom", legend.title = element_blank(), legend.text = element_text(size = 17)) +
  ylim(-1.1, 1.2)
ggsave("Ebene Gruppen.pdf", width = 11, height = 8)


## Zwei Variablen
ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":") %>% filter(var %in% c("Abspielungen", "Pausen")), aes(Dim.1, Dim.2)) + 
  geom_path(aes(group = var), linetype = "dashed", size = 1.25) +
  geom_point(shape = 17, size = 4) +
  geom_text_repel(aes(label = rowname), point.padding = unit(0.25, "lines")) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.3)
ggsave("3 Ebene 2.pdf", width = 11, height = 8)

## Drei Variablen
ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":") %>% filter(var %in% c("Abspielungen", "Pausen", "Besuchszeit")), aes(Dim.1, Dim.2)) + 
  geom_path(aes(group = var), linetype = "dashed", size = 1.25) +
  geom_point(shape = 17, size = 4) +
  geom_text_repel(aes(label = rowname), point.padding = unit(0.25, "lines")) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.3)
ggsave("4 Ebene 3.pdf", width = 11, height = 8)

## Alle Variablen
ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":"), aes(Dim.1, Dim.2)) + 
  geom_path(aes(group = var), linetype = "dashed", size = 1.25) +
  geom_point(shape = 17, size = 4) +
  geom_text_repel(aes(label = rowname), point.padding = unit(0.25, "lines")) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.3)
ggsave("5 Ebene Alle.pdf", width = 11, height = 8)

## Nur Linien
ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":"), aes(Dim.1, Dim.2)) + 
  geom_path(aes(group = var), linetype = "dashed", size = 1.25) +
  geom_point(shape = 17, size = 4) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.3)
ggsave("6 Ebene Linien.pdf", width = 11, height = 8)

## Nur Kategorien
ggplot(mca_res$var$coord %>% data.frame %>% rownames_to_column %>% separate(rowname, c("var", "cat"), remove = FALSE, sep = ":"), aes(Dim.1, Dim.2)) + 
  geom_point(shape = 17, size = 4) +
  geom_text_repel(aes(label = rowname), point.padding = unit(0.25, "lines")) +
  geom_point(data = mca_res$ind$coord %>% data.frame, aes(Dim.1, Dim.2), alpha = 0.3, size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.3) + ylim(-1.1, 1.3)
ggsave("7 Ebene Kategorien.pdf", width = 11, height = 8)

## Hierarchische Clusteranalyse Farbgruppen
hcpc_res <- HCPC(mca_res, nb.clust = 3, graph = FALSE)
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  hcpc_res$data.clust$clust %>% data.frame(cluster = .))
ggplot(daten, aes(Dim.1, Dim.2, group = cluster, colour = cluster)) +
  geom_point(size = 2) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) + xlim(-1.8, 1.2) + ylim(-1.1, 1.3)
ggsave("8 Cluster Farben.pdf", width = 11, height = 8)

## Hierarchische Clusteranalyse Ellipsen
hcpc_res <- HCPC(mca_res, nb.clust = 3, graph = FALSE)
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  hcpc_res$data.clust$clust %>% data.frame(cluster = .))
ggplot(daten, aes(Dim.1, Dim.2, group = cluster, colour = cluster)) +
  geom_point(size = 2, show.legend = FALSE) +
  stat_ellipse(level = 0.86, type = "norm", show.legend = FALSE) +
  geom_point(data = daten %>% group_by(cluster) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, fill = cluster), shape = 23, size = 3, stroke = 2, show.legend = FALSE) +
#  geom_label_repel(data = daten %>% group_by(cluster) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, colour = cluster, label = cluster), show.legend = FALSE) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) 
ggsave("9 Cluster Ellipsen.pdf", width = 11, height = 8)

## Geräte
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  datensatz_synthesise_users_gda$average_visit_devices %>% data.frame(devices = .))
ggplot(daten, aes(Dim.1, Dim.2, group = devices, colour = devices)) +
  geom_point(size = 2, show.legend = FALSE) +
  stat_ellipse(level = 0.86, type = "norm", show.legend = FALSE) +
  geom_point(data = daten %>% group_by(devices) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, fill = devices), shape = 23, size = 3, stroke = 2, show.legend = FALSE) +
  geom_label_repel(data = daten %>% group_by(devices) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, colour = devices, label = devices), show.legend = FALSE) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) 
ggsave("10 Geräte Ellipsen.pdf", width = 11, height = 8)

## Städte 
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  datensatz_synthesise_users_gda$average_visit_city %>% data.frame(city = .)) %>% filter(city %in% c("Frankfurt Am Main", "Karlsruhe", "Stuttgart", "Freiburg", "Heidelberg", "Pforzheim", "Ubstadt-weiher", "Heilbronn", "Mannheim"))
daten_invers <- bind_cols(mca_res$ind$coord %>% data.frame,  datensatz_synthesise_users_gda$average_visit_city %>% data.frame(city = .)) %>% filter(city %nin% c("Frankfurt Am Main", "Karlsruhe", "Stuttgart", "Freiburg", "Heidelberg", "Pforzheim", "Ubstadt-weiher", "Heilbronn", "Mannheim"))
ggplot(daten, aes(Dim.1, Dim.2, group = city, colour = city)) +
  geom_point(size = 2, show.legend = FALSE) +
  geom_point(data = daten_invers, inherit.aes = FALSE, aes(Dim.1, Dim.2), alpha = 0.5) +
  geom_point(data = daten %>% group_by(city) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, fill = city), shape = 23, size = 3, stroke = 2, show.legend = FALSE) +
  geom_label_repel(data = daten %>% group_by(city) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, colour = city, label = city), show.legend = FALSE) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) 
ggsave("11 Städte.pdf", width = 11, height = 8)

## Tage 
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  datensatz_synthesise_users_gda$average_visit_day %>% data.frame(day = .) %>%
                     mutate(day = fct_recode(as_factor(day), 
                                "Montag" = "Monday",
                                "Dienstag" = "Tuesday",
                                "Mittwoch" = "Wednesday",
                                "Donnerstag" = "Thursday",
                                "Freitag" = "Friday",
                                "Samstag" = "Saturday",
                                "Sonntag" = "Sunday"),
                            day = fct_relevel(day,
                                              "Montag", 
                                              "Dienstag", 
                                              "Mittwoch", 
                                              "Donnerstag", 
                                              "Freitag", 
                                              "Samstag", 
                                              "Sonntag")
                            ))
ggplot(daten, aes(Dim.1, Dim.2, group = day, colour = day)) +
  geom_point(size = 2, show.legend = FALSE) +
  geom_point(data = daten_invers, inherit.aes = FALSE, aes(Dim.1, Dim.2), alpha = 0.5) +
  geom_point(data = daten %>% group_by(day) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, fill = day), shape = 23, size = 3, stroke = 2, show.legend = FALSE) +
  geom_label_repel(data = daten %>% group_by(day) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, colour = day, label = day), show.legend = FALSE) +
  geom_path(data = daten %>% group_by(day) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2), linetype = "dashed", size = 1.5) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) 
ggsave("12 Tage.pdf", width = 11, height = 8)

# Zeiten
daten <- bind_cols(mca_res$ind$coord %>% data.frame,  datensatz_synthesise_users_gda$average_visit_hour %>% data.frame(hour = .))
ggplot(daten, aes(Dim.1, Dim.2, group = hour, colour = hour)) +
  geom_point(size = 2, show.legend = FALSE) +
  geom_point(data = daten_invers, inherit.aes = FALSE, aes(Dim.1, Dim.2), alpha = 0.5) +
  geom_point(data = daten %>% group_by(hour) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, fill = hour), shape = 23, size = 3, stroke = 2, show.legend = FALSE) +
  geom_label_repel(data = daten %>% group_by(hour) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2, colour = hour, label = hour), show.legend = FALSE) +
  geom_path(data = daten %>% group_by(hour) %>% select(Dim.1, Dim.2) %>% summarise_all(funs(mean)), inherit.aes = FALSE, aes(Dim.1, Dim.2), linetype = "dashed", size = 1.5) +
  theme_bw() + ylab("") + xlab(paste0("Die Ebene erklärt ", modif.rate(mca_res)[2,2], "% Varianz.")) 
ggsave("13 Tageszeiten.pdf", width = 11, height = 8)
