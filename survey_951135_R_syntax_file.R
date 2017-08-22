data_limesurvey <- read.csv("survey_951135_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE)


# LimeSurvey Field type: F
data_limesurvey[, 1] <- as.numeric(data_limesurvey[, 1])
attributes(data_limesurvey)$variable.labels[1] <- "id"
names(data_limesurvey)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
data_limesurvey[, 2] <- as.character(data_limesurvey[, 2])
attributes(data_limesurvey)$variable.labels[2] <- "submitdate"
names(data_limesurvey)[2] <- "submitdate"
# LimeSurvey Field type: F
data_limesurvey[, 3] <- as.numeric(data_limesurvey[, 3])
attributes(data_limesurvey)$variable.labels[3] <- "lastpage"
names(data_limesurvey)[3] <- "lastpage"
# LimeSurvey Field type: A
data_limesurvey[, 4] <- as.character(data_limesurvey[, 4])
attributes(data_limesurvey)$variable.labels[4] <- "startlanguage"
names(data_limesurvey)[4] <- "startlanguage"
# LimeSurvey Field type: A
data_limesurvey[, 5] <- as.character(data_limesurvey[, 5])
attributes(data_limesurvey)$variable.labels[5] <- "refurl"
names(data_limesurvey)[5] <- "refurl"
# LimeSurvey Field type: F
data_limesurvey[, 6] <- as.numeric(data_limesurvey[, 6])
attributes(data_limesurvey)$variable.labels[6] <- "[Die einzelnen Bestandteile der Gesamtveranstaltung (online-Lektionen, Mentoriate, HGF-Vorlesungen) ergänzen sich.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 6] <- factor(data_limesurvey[, 6], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[6] <- "G1Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 7] <- as.numeric(data_limesurvey[, 7])
attributes(data_limesurvey)$variable.labels[7] <- "[Das eigenverantwortliche Lernen wird durch das Gesamtkonzept gefördert.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 7] <- factor(data_limesurvey[, 7], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[7] <- "G1Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 8] <- as.numeric(data_limesurvey[, 8])
attributes(data_limesurvey)$variable.labels[8] <- "[Ich hätte die Dozenten gerne häufiger in der Aula erlebt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 8] <- factor(data_limesurvey[, 8], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[8] <- "G1Q00001_3"
# LimeSurvey Field type: F
data_limesurvey[, 9] <- as.numeric(data_limesurvey[, 9])
attributes(data_limesurvey)$variable.labels[9] <- "[Die Mentoren konnten uns bei der Klärung von inhaltlichen Fragen angemessen unterstützen.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 9] <- factor(data_limesurvey[, 9], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[9] <- "G1Q00001_4"
# LimeSurvey Field type: F
data_limesurvey[, 10] <- as.numeric(data_limesurvey[, 10])
attributes(data_limesurvey)$variable.labels[10] <- "[Die Unterstützung durch die Mentoren als Tandem war vorteilhaft.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 10] <- factor(data_limesurvey[, 10], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[10] <- "G1Q00001_5"
# LimeSurvey Field type: F
data_limesurvey[, 11] <- as.numeric(data_limesurvey[, 11])
attributes(data_limesurvey)$variable.labels[11] <- "[Die Mentoren konnten mich bei Fragen in Bezug auf das Studium unterstützen.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 11] <- factor(data_limesurvey[, 11], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[11] <- "G1Q00001_6"
# LimeSurvey Field type: F
data_limesurvey[, 12] <- as.numeric(data_limesurvey[, 12])
attributes(data_limesurvey)$variable.labels[12] <- "[Der Lerngewinn der Veranstaltung war sehr hoch.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 12] <- factor(data_limesurvey[, 12], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[12] <- "G1Q00001_7"
# LimeSurvey Field type: F
data_limesurvey[, 13] <- as.numeric(data_limesurvey[, 13])
attributes(data_limesurvey)$variable.labels[13] <- "[Die Einführung der Mentoren in den Umgang mit wissenschaftlichen Texten war für mich sehr hilfreich.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 13] <- factor(data_limesurvey[, 13], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[13] <- "G1Q00001_8"
# LimeSurvey Field type: F
data_limesurvey[, 14] <- as.numeric(data_limesurvey[, 14])
attributes(data_limesurvey)$variable.labels[14] <- "[Die kritische Auseinandersetzung und Reflexion wurde durch das Gesamtkonzept begünstigt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 14] <- factor(data_limesurvey[, 14], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[14] <- "G1Q00001_9"
# LimeSurvey Field type: F
data_limesurvey[, 15] <- as.numeric(data_limesurvey[, 15])
attributes(data_limesurvey)$variable.labels[15] <- "[Ohne Klausur hätte ich mich mit den Inhalten der Veranstaltung genauso intensiv auseinandergesetzt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 15] <- factor(data_limesurvey[, 15], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[15] <- "G1Q00001_10"
# LimeSurvey Field type: F
data_limesurvey[, 16] <- as.numeric(data_limesurvey[, 16])
attributes(data_limesurvey)$variable.labels[16] <- "[Die Gesamtveranstaltung hat mein Interesse an erziehungswissenschaftlichen Fragen geweckt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 16] <- factor(data_limesurvey[, 16], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[16] <- "G1Q00001_11"
# LimeSurvey Field type: F
data_limesurvey[, 17] <- as.numeric(data_limesurvey[, 17])
attributes(data_limesurvey)$variable.labels[17] <- "[Mit der Organisation der Gesamtveranstaltung war ich jederzeit zufrieden.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data_limesurvey[, 17] <- factor(data_limesurvey[, 17], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[17] <- "G1Q00001_12"
# LimeSurvey Field type: F
data_limesurvey[, 18] <- as.numeric(data_limesurvey[, 18])
attributes(data_limesurvey)$variable.labels[18] <- "[Der Zeitaufwand für die Vorbereitung im Vergleich zu anderen Fächern war angemessen.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data_limesurvey[, 18] <- factor(data_limesurvey[, 18], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[18] <- "G2Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 19] <- as.numeric(data_limesurvey[, 19])
attributes(data_limesurvey)$variable.labels[19] <- "[Ich hatte genug Zeit, um mich mithilfe der online-Lektionen und der Texte vorzubereiten.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data_limesurvey[, 19] <- factor(data_limesurvey[, 19], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[19] <- "G2Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 20] <- as.numeric(data_limesurvey[, 20])
attributes(data_limesurvey)$variable.labels[20] <- "[Ich hätte gerne mehr Zeit gehabt, um mich mit den Themen zu beschäftigen.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data_limesurvey[, 20] <- factor(data_limesurvey[, 20], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[20] <- "G2Q00001_3"
# LimeSurvey Field type: F
data_limesurvey[, 21] <- as.numeric(data_limesurvey[, 21])
attributes(data_limesurvey)$variable.labels[21] <- "[Ich stelle oft Dinge in Frage, die ich in Vorlesungen höre oder in Büchern lese.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data_limesurvey[, 21] <- factor(data_limesurvey[, 21], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[21] <- "G2Q00001_4"
# LimeSurvey Field type: F
data_limesurvey[, 22] <- as.numeric(data_limesurvey[, 22])
attributes(data_limesurvey)$variable.labels[22] <- "[Dinge, die ich in dieser Lehrveranstaltung höre oder lese, hinterfrage ich, um entscheiden zu können, ob ich sie überzeugend finde.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data_limesurvey[, 22] <- factor(data_limesurvey[, 22], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[22] <- "G2Q00001_5"
# LimeSurvey Field type: F
data_limesurvey[, 23] <- as.numeric(data_limesurvey[, 23])
attributes(data_limesurvey)$variable.labels[23] <- "[Ich konnte die Web-App problemlos bedienen.] Die folgenden Aussagen beziehen sich auf die Web-App."
data_limesurvey[, 23] <- factor(data_limesurvey[, 23], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[23] <- "G3Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 24] <- as.numeric(data_limesurvey[, 24])
attributes(data_limesurvey)$variable.labels[24] <- "[Die Web-App ist sehr übersichtlich gestaltet.] Die folgenden Aussagen beziehen sich auf die Web-App."
data_limesurvey[, 24] <- factor(data_limesurvey[, 24], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[24] <- "G3Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 25] <- as.numeric(data_limesurvey[, 25])
attributes(data_limesurvey)$variable.labels[25] <- "[Durch die Web-App war ich immer sehr gut informiert.] Die folgenden Aussagen beziehen sich auf die Web-App."
data_limesurvey[, 25] <- factor(data_limesurvey[, 25], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[25] <- "G3Q00001_3"
# LimeSurvey Field type: F
data_limesurvey[, 26] <- as.numeric(data_limesurvey[, 26])
attributes(data_limesurvey)$variable.labels[26] <- "[Die Notizfunktion war völlig überflüssig.] Die folgenden Aussagen beziehen sich auf die Web-App."
data_limesurvey[, 26] <- factor(data_limesurvey[, 26], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[26] <- "G3Q00001_4"
# LimeSurvey Field type: F
data_limesurvey[, 27] <- as.numeric(data_limesurvey[, 27])
attributes(data_limesurvey)$variable.labels[27] <- "[Die online-Lektionen zusammen mit den Plenumsveranstaltungen und Mentoriaten bevorzuge ich im Vergleich zu einer herkömmlichen Präsenz-Vorlesung mit ca. 300–400 Studierenden.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 27] <- factor(data_limesurvey[, 27], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[27] <- "G4Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 28] <- as.numeric(data_limesurvey[, 28])
attributes(data_limesurvey)$variable.labels[28] <- "[Die Verfügbarkeit des Online-Formats kommt mir entgegen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 28] <- factor(data_limesurvey[, 28], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[28] <- "G4Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 29] <- as.numeric(data_limesurvey[, 29])
attributes(data_limesurvey)$variable.labels[29] <- "[Die Dauer der Online-Vorlesungen ist sehr angemessen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 29] <- factor(data_limesurvey[, 29], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[29] <- "G4Q00001_3"
# LimeSurvey Field type: F
data_limesurvey[, 30] <- as.numeric(data_limesurvey[, 30])
attributes(data_limesurvey)$variable.labels[30] <- "[Verglichen mit 90 minütigen Präsenzvorlesungen habe ich in den kürzeren online-Lektionen mehr gelernt.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 30] <- factor(data_limesurvey[, 30], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[30] <- "G4Q00001_4"
# LimeSurvey Field type: F
data_limesurvey[, 31] <- as.numeric(data_limesurvey[, 31])
attributes(data_limesurvey)$variable.labels[31] <- "[Beim Abspielen der online-Lektionen hatte ich immer wieder Probleme.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 31] <- factor(data_limesurvey[, 31], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[31] <- "G4Q00001_5"
# LimeSurvey Field type: F
data_limesurvey[, 32] <- as.numeric(data_limesurvey[, 32])
attributes(data_limesurvey)$variable.labels[32] <- "[Wenn ja, konnten diese Probleme mit Unterstützung durch die Veranstalter schnell gelöst werden.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 32] <- factor(data_limesurvey[, 32], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[32] <- "G4Q00001_6"
# LimeSurvey Field type: F
data_limesurvey[, 33] <- as.numeric(data_limesurvey[, 33])
attributes(data_limesurvey)$variable.labels[33] <- "[Die ca. 30 minütigen online-Lektionen stellen für mich im Vergleich zu 90 minütigen Präsenzvorlesungen eine Zeitersparnis dar.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 33] <- factor(data_limesurvey[, 33], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[33] <- "G4Q00001_7"
# LimeSurvey Field type: F
data_limesurvey[, 34] <- as.numeric(data_limesurvey[, 34])
attributes(data_limesurvey)$variable.labels[34] <- "[Die Unabhängigkeit von festen Vorlesungsterminen kam mir sehr entgegen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 34] <- factor(data_limesurvey[, 34], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[34] <- "G4Q00001_8"
# LimeSurvey Field type: F
data_limesurvey[, 35] <- as.numeric(data_limesurvey[, 35])
attributes(data_limesurvey)$variable.labels[35] <- "[Die Möglichkeit des Zurückspulens, Anhaltens und Wiederholen stellt für mich einen erheblichen Vorteil dar.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 35] <- factor(data_limesurvey[, 35], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[35] <- "G4Q00001_9"
# LimeSurvey Field type: F
data_limesurvey[, 36] <- as.numeric(data_limesurvey[, 36])
attributes(data_limesurvey)$variable.labels[36] <- "[Die Abhängigkeit vom Internet war für mich ein großer Nachteil.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 36] <- factor(data_limesurvey[, 36], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[36] <- "G4Q00001_10"
# LimeSurvey Field type: F
data_limesurvey[, 37] <- as.numeric(data_limesurvey[, 37])
attributes(data_limesurvey)$variable.labels[37] <- "[Dass die Vorlesungen von vier Dozenten gehalten wurden (und nicht von einem) ist sinnvoll.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data_limesurvey[, 37] <- factor(data_limesurvey[, 37], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[37] <- "G4Q00001_11"
# LimeSurvey Field type: F
data_limesurvey[, 38] <- as.numeric(data_limesurvey[, 38])
attributes(data_limesurvey)$variable.labels[38] <- "[Sozialgeschichte der Erziehung und Bildung] Die Gestaltung der Videos finde ich sehr gelungen."
data_limesurvey[, 38] <- factor(data_limesurvey[, 38], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[38] <- "G4Q00002_1"
# LimeSurvey Field type: F
data_limesurvey[, 39] <- as.numeric(data_limesurvey[, 39])
attributes(data_limesurvey)$variable.labels[39] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die Gestaltung der Videos finde ich sehr gelungen."
data_limesurvey[, 39] <- factor(data_limesurvey[, 39], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[39] <- "G4Q00002_2"
# LimeSurvey Field type: F
data_limesurvey[, 40] <- as.numeric(data_limesurvey[, 40])
attributes(data_limesurvey)$variable.labels[40] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die Gestaltung der Videos finde ich sehr gelungen."
data_limesurvey[, 40] <- factor(data_limesurvey[, 40], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[40] <- "G4Q00002_3"
# LimeSurvey Field type: F
data_limesurvey[, 41] <- as.numeric(data_limesurvey[, 41])
attributes(data_limesurvey)$variable.labels[41] <- "[Erziehung und Schule] Die Gestaltung der Videos finde ich sehr gelungen."
data_limesurvey[, 41] <- factor(data_limesurvey[, 41], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[41] <- "G4Q00002_4"
# LimeSurvey Field type: F
data_limesurvey[, 42] <- as.numeric(data_limesurvey[, 42])
attributes(data_limesurvey)$variable.labels[42] <- "[Bildung – Glück – Gerechtigkeit] Die Gestaltung der Videos finde ich sehr gelungen."
data_limesurvey[, 42] <- factor(data_limesurvey[, 42], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[42] <- "G4Q00002_5"
# LimeSurvey Field type: F
data_limesurvey[, 43] <- as.numeric(data_limesurvey[, 43])
attributes(data_limesurvey)$variable.labels[43] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data_limesurvey[, 43] <- factor(data_limesurvey[, 43], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[43] <- "G4Q00003_1"
# LimeSurvey Field type: F
data_limesurvey[, 44] <- as.numeric(data_limesurvey[, 44])
attributes(data_limesurvey)$variable.labels[44] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data_limesurvey[, 44] <- factor(data_limesurvey[, 44], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[44] <- "G4Q00003_2"
# LimeSurvey Field type: F
data_limesurvey[, 45] <- as.numeric(data_limesurvey[, 45])
attributes(data_limesurvey)$variable.labels[45] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data_limesurvey[, 45] <- factor(data_limesurvey[, 45], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[45] <- "G4Q00003_3"
# LimeSurvey Field type: F
data_limesurvey[, 46] <- as.numeric(data_limesurvey[, 46])
attributes(data_limesurvey)$variable.labels[46] <- "[Erziehung und Schule] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data_limesurvey[, 46] <- factor(data_limesurvey[, 46], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[46] <- "G4Q00003_4"
# LimeSurvey Field type: F
data_limesurvey[, 47] <- as.numeric(data_limesurvey[, 47])
attributes(data_limesurvey)$variable.labels[47] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data_limesurvey[, 47] <- factor(data_limesurvey[, 47], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[47] <- "G4Q00003_5"
# LimeSurvey Field type: F
data_limesurvey[, 48] <- as.numeric(data_limesurvey[, 48])
attributes(data_limesurvey)$variable.labels[48] <- "[Sozialgeschichte der Erziehung und Bildung] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data_limesurvey[, 48] <- factor(data_limesurvey[, 48], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[48] <- "G4Q00004_1"
# LimeSurvey Field type: F
data_limesurvey[, 49] <- as.numeric(data_limesurvey[, 49])
attributes(data_limesurvey)$variable.labels[49] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data_limesurvey[, 49] <- factor(data_limesurvey[, 49], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[49] <- "G4Q00004_2"
# LimeSurvey Field type: F
data_limesurvey[, 50] <- as.numeric(data_limesurvey[, 50])
attributes(data_limesurvey)$variable.labels[50] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data_limesurvey[, 50] <- factor(data_limesurvey[, 50], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[50] <- "G4Q00004_3"
# LimeSurvey Field type: F
data_limesurvey[, 51] <- as.numeric(data_limesurvey[, 51])
attributes(data_limesurvey)$variable.labels[51] <- "[Erziehung und Schule] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data_limesurvey[, 51] <- factor(data_limesurvey[, 51], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[51] <- "G4Q00004_4"
# LimeSurvey Field type: F
data_limesurvey[, 52] <- as.numeric(data_limesurvey[, 52])
attributes(data_limesurvey)$variable.labels[52] <- "[Bildung – Glück – Gerechtigkeit] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data_limesurvey[, 52] <- factor(data_limesurvey[, 52], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[52] <- "G4Q00004_5"
# LimeSurvey Field type: F
data_limesurvey[, 53] <- as.numeric(data_limesurvey[, 53])
attributes(data_limesurvey)$variable.labels[53] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen waren gut strukturiert."
data_limesurvey[, 53] <- factor(data_limesurvey[, 53], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[53] <- "G4Q00005_1"
# LimeSurvey Field type: F
data_limesurvey[, 54] <- as.numeric(data_limesurvey[, 54])
attributes(data_limesurvey)$variable.labels[54] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen waren gut strukturiert."
data_limesurvey[, 54] <- factor(data_limesurvey[, 54], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[54] <- "G4Q00005_2"
# LimeSurvey Field type: F
data_limesurvey[, 55] <- as.numeric(data_limesurvey[, 55])
attributes(data_limesurvey)$variable.labels[55] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen waren gut strukturiert."
data_limesurvey[, 55] <- factor(data_limesurvey[, 55], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[55] <- "G4Q00005_3"
# LimeSurvey Field type: F
data_limesurvey[, 56] <- as.numeric(data_limesurvey[, 56])
attributes(data_limesurvey)$variable.labels[56] <- "[Erziehung und Schule] Die online-Lektionen waren gut strukturiert."
data_limesurvey[, 56] <- factor(data_limesurvey[, 56], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[56] <- "G4Q00005_4"
# LimeSurvey Field type: F
data_limesurvey[, 57] <- as.numeric(data_limesurvey[, 57])
attributes(data_limesurvey)$variable.labels[57] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen waren gut strukturiert."
data_limesurvey[, 57] <- factor(data_limesurvey[, 57], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[57] <- "G4Q00005_5"
# LimeSurvey Field type: F
data_limesurvey[, 58] <- as.numeric(data_limesurvey[, 58])
attributes(data_limesurvey)$variable.labels[58] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen war vom Umfang her angemessen."
data_limesurvey[, 58] <- factor(data_limesurvey[, 58], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[58] <- "G4Q00006_1"
# LimeSurvey Field type: F
data_limesurvey[, 59] <- as.numeric(data_limesurvey[, 59])
attributes(data_limesurvey)$variable.labels[59] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen war vom Umfang her angemessen."
data_limesurvey[, 59] <- factor(data_limesurvey[, 59], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[59] <- "G4Q00006_2"
# LimeSurvey Field type: F
data_limesurvey[, 60] <- as.numeric(data_limesurvey[, 60])
attributes(data_limesurvey)$variable.labels[60] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen war vom Umfang her angemessen."
data_limesurvey[, 60] <- factor(data_limesurvey[, 60], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[60] <- "G4Q00006_3"
# LimeSurvey Field type: F
data_limesurvey[, 61] <- as.numeric(data_limesurvey[, 61])
attributes(data_limesurvey)$variable.labels[61] <- "[Erziehung und Schule] Die online-Lektionen war vom Umfang her angemessen."
data_limesurvey[, 61] <- factor(data_limesurvey[, 61], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[61] <- "G4Q00006_4"
# LimeSurvey Field type: F
data_limesurvey[, 62] <- as.numeric(data_limesurvey[, 62])
attributes(data_limesurvey)$variable.labels[62] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen war vom Umfang her angemessen."
data_limesurvey[, 62] <- factor(data_limesurvey[, 62], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[62] <- "G4Q00006_5"
# LimeSurvey Field type: F
data_limesurvey[, 63] <- as.numeric(data_limesurvey[, 63])
attributes(data_limesurvey)$variable.labels[63] <- "[Die methodische Vorgehensweise im Mentoriat war immer klar und transparent.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data_limesurvey[, 63] <- factor(data_limesurvey[, 63], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[63] <- "G5Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 64] <- as.numeric(data_limesurvey[, 64])
attributes(data_limesurvey)$variable.labels[64] <- "[Durch die verschiedenen Arbeitsweisen und Themenschwerpunkte in den anderen Mentoriaten war ich verunsichert.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data_limesurvey[, 64] <- factor(data_limesurvey[, 64], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[64] <- "G5Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 65] <- as.numeric(data_limesurvey[, 65])
attributes(data_limesurvey)$variable.labels[65] <- "[Die methodische Vielfalt in den Mentoriaten hat mir die Bearbeitung der Inhalte wesentlich erleichtert.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data_limesurvey[, 65] <- factor(data_limesurvey[, 65], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[65] <- "G5Q00001_3"
# LimeSurvey Field type: F
data_limesurvey[, 66] <- as.numeric(data_limesurvey[, 66])
attributes(data_limesurvey)$variable.labels[66] <- "[Ich würde gerne selbst Mentorin bzw. Mentor werden.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data_limesurvey[, 66] <- factor(data_limesurvey[, 66], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[66] <- "G5Q00001_4"
# LimeSurvey Field type: F
data_limesurvey[, 67] <- as.numeric(data_limesurvey[, 67])
attributes(data_limesurvey)$variable.labels[67] <- "[Die \"Häufig gestellten Fragen\"-Vorlesungen waren hilfreich, um offene Fragen zu klären.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data_limesurvey[, 67] <- factor(data_limesurvey[, 67], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[67] <- "G6Q00001_1"
# LimeSurvey Field type: F
data_limesurvey[, 68] <- as.numeric(data_limesurvey[, 68])
attributes(data_limesurvey)$variable.labels[68] <- "[Die \"Häufig gestellten Fragen\"-Vorlesungen waren überflüssig, da ich keine offenen Fragen hatte.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data_limesurvey[, 68] <- factor(data_limesurvey[, 68], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[68] <- "G6Q00001_2"
# LimeSurvey Field type: F
data_limesurvey[, 69] <- as.numeric(data_limesurvey[, 69])
attributes(data_limesurvey)$variable.labels[69] <- "[Ich habe alle meine offenen Fragen an die Mentoren weitergegeben.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data_limesurvey[, 69] <- factor(data_limesurvey[, 69], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[69] <- "G6Q00001_3"
# LimeSurvey Field type: A
data_limesurvey[, 70] <- as.character(data_limesurvey[, 70])
attributes(data_limesurvey)$variable.labels[70] <- "[Timo Hoyer (2005): Ethik und Moralerziehung] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 70] <- factor(data_limesurvey[, 70], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[70] <- "G7Q00001_1"
# LimeSurvey Field type: A
data_limesurvey[, 71] <- as.character(data_limesurvey[, 71])
attributes(data_limesurvey)$variable.labels[71] <- "[Oskar Negt (1997): Vom Kindheitsmythos zur Lebenswelt der Kinder] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 71] <- factor(data_limesurvey[, 71], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[71] <- "G7Q00001_2"
# LimeSurvey Field type: A
data_limesurvey[, 72] <- as.character(data_limesurvey[, 72])
attributes(data_limesurvey)$variable.labels[72] <- "[Heinz-Elmar Tenorth (1988): Geschichte der Erziehung] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 72] <- factor(data_limesurvey[, 72], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[72] <- "G7Q00001_3"
# LimeSurvey Field type: A
data_limesurvey[, 73] <- as.character(data_limesurvey[, 73])
attributes(data_limesurvey)$variable.labels[73] <- "[Auszug aus »Émile« (1762) und »Julie« (1761)] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 73] <- factor(data_limesurvey[, 73], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[73] <- "G7Q00001_4"
# LimeSurvey Field type: A
data_limesurvey[, 74] <- as.character(data_limesurvey[, 74])
attributes(data_limesurvey)$variable.labels[74] <- "[Auszug aus dem »Stanser Brief« (1807)] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 74] <- factor(data_limesurvey[, 74], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[74] <- "G7Q00001_5"
# LimeSurvey Field type: A
data_limesurvey[, 75] <- as.character(data_limesurvey[, 75])
attributes(data_limesurvey)$variable.labels[75] <- "[Auszug aus dem »Königsberger« und dem »Litauischer Schulplan« (1809)] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 75] <- factor(data_limesurvey[, 75], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[75] <- "G7Q00001_6"
# LimeSurvey Field type: A
data_limesurvey[, 76] <- as.character(data_limesurvey[, 76])
attributes(data_limesurvey)$variable.labels[76] <- "[Franz Kafka (1919): Brief an den Vater] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 76] <- factor(data_limesurvey[, 76], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[76] <- "G7Q00001_7"
# LimeSurvey Field type: A
data_limesurvey[, 77] <- as.character(data_limesurvey[, 77])
attributes(data_limesurvey)$variable.labels[77] <- "[Richard von Weizsäcker (1993): Ansprache bei der Eröffnungsveranstaltung der Tagung der Bundesarbeitsgemeinschaft Hilfe für Behinderte] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 77] <- factor(data_limesurvey[, 77], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[77] <- "G7Q00001_8"
# LimeSurvey Field type: A
data_limesurvey[, 78] <- as.character(data_limesurvey[, 78])
attributes(data_limesurvey)$variable.labels[78] <- "[Konrad Paul Liessmann (2006): Theorie der Unbildung] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 78] <- factor(data_limesurvey[, 78], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[78] <- "G7Q00001_9"
# LimeSurvey Field type: A
data_limesurvey[, 79] <- as.character(data_limesurvey[, 79])
attributes(data_limesurvey)$variable.labels[79] <- "[Timo Hoyer (2011): Glück soll lernbar sein? Ist es aber nicht!] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 79] <- factor(data_limesurvey[, 79], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[79] <- "G7Q00001_10"
# LimeSurvey Field type: A
data_limesurvey[, 80] <- as.character(data_limesurvey[, 80])
attributes(data_limesurvey)$variable.labels[80] <- "[Krassimir Stojanov (2011): Bildungsgerechtigkeit] Wie verständlich fanden Sie die Texte?"
data_limesurvey[, 80] <- factor(data_limesurvey[, 80], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data_limesurvey)[80] <- "G7Q00001_11"
# LimeSurvey Field type: A
data_limesurvey[, 81] <- as.character(data_limesurvey[, 81])
attributes(data_limesurvey)$variable.labels[81] <- "[Widersprüche zwischen den Texten und den online-Lektionen haben mich sehr irritiert.] Aussagen in Bezug auf den Umgang mit den Texten."
data_limesurvey[, 81] <- factor(data_limesurvey[, 81], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[81] <- "G7Q00002_1"
# LimeSurvey Field type: A
data_limesurvey[, 82] <- as.character(data_limesurvey[, 82])
attributes(data_limesurvey)$variable.labels[82] <- "[Durch die Textarbeit hat sich mein Verständnis von erziehungswissenschaftlichen Fragen erweitert.] Aussagen in Bezug auf den Umgang mit den Texten."
data_limesurvey[, 82] <- factor(data_limesurvey[, 82], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data_limesurvey)[82] <- "G7Q00002_2"
# LimeSurvey Field type: F
data_limesurvey[, 83] <- as.numeric(data_limesurvey[, 83])
attributes(data_limesurvey)$variable.labels[83] <- "Wie groß war die wöchentliche Vorbereitungzeit bzgl. der Texte?"
names(data_limesurvey)[83] <- "G7Q00003"
# LimeSurvey Field type: 
data_limesurvey[, 84] <- as.numeric(data_limesurvey[, 84])
attributes(data_limesurvey)$variable.labels[84] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 85] <- as.numeric(data_limesurvey[, 85])
attributes(data_limesurvey)$variable.labels[85] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 86] <- as.numeric(data_limesurvey[, 86])
attributes(data_limesurvey)$variable.labels[86] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 87] <- as.numeric(data_limesurvey[, 87])
attributes(data_limesurvey)$variable.labels[87] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 88] <- as.numeric(data_limesurvey[, 88])
attributes(data_limesurvey)$variable.labels[88] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 89] <- as.numeric(data_limesurvey[, 89])
attributes(data_limesurvey)$variable.labels[89] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 90] <- as.numeric(data_limesurvey[, 90])
attributes(data_limesurvey)$variable.labels[90] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 91] <- as.numeric(data_limesurvey[, 91])
attributes(data_limesurvey)$variable.labels[91] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 92] <- as.numeric(data_limesurvey[, 92])
attributes(data_limesurvey)$variable.labels[92] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 93] <- as.numeric(data_limesurvey[, 93])
attributes(data_limesurvey)$variable.labels[93] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 94] <- as.numeric(data_limesurvey[, 94])
attributes(data_limesurvey)$variable.labels[94] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 95] <- as.numeric(data_limesurvey[, 95])
attributes(data_limesurvey)$variable.labels[95] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 96] <- as.numeric(data_limesurvey[, 96])
attributes(data_limesurvey)$variable.labels[96] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 97] <- as.numeric(data_limesurvey[, 97])
attributes(data_limesurvey)$variable.labels[97] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 98] <- as.numeric(data_limesurvey[, 98])
attributes(data_limesurvey)$variable.labels[98] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 99] <- as.numeric(data_limesurvey[, 99])
attributes(data_limesurvey)$variable.labels[99] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 100] <- as.numeric(data_limesurvey[, 100])
attributes(data_limesurvey)$variable.labels[100] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 101] <- as.numeric(data_limesurvey[, 101])
attributes(data_limesurvey)$variable.labels[101] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 102] <- as.numeric(data_limesurvey[, 102])
attributes(data_limesurvey)$variable.labels[102] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 103] <- as.numeric(data_limesurvey[, 103])
attributes(data_limesurvey)$variable.labels[103] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 104] <- as.numeric(data_limesurvey[, 104])
attributes(data_limesurvey)$variable.labels[104] <- ""
#sql_name not set
# LimeSurvey Field type: 
data_limesurvey[, 105] <- as.numeric(data_limesurvey[, 105])
attributes(data_limesurvey)$variable.labels[105] <- ""
#sql_name not set
