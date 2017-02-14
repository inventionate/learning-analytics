data <- read.csv("survey_951135_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE)


# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
data[, 3] <- as.numeric(data[, 3])
attributes(data)$variable.labels[3] <- "lastpage"
names(data)[3] <- "lastpage"
# LimeSurvey Field type: A
data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "startlanguage"
# LimeSurvey Field type: A
data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "refurl"
names(data)[5] <- "refurl"
# LimeSurvey Field type: F
data[, 6] <- as.numeric(data[, 6])
attributes(data)$variable.labels[6] <- "[Die einzelnen Bestandteile der Gesamtveranstaltung (online-Lektionen, Mentoriate, HGF-Vorlesungen) ergänzen sich.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 6] <- factor(data[, 6], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[6] <- "G1Q00001_1"
# LimeSurvey Field type: F
data[, 7] <- as.numeric(data[, 7])
attributes(data)$variable.labels[7] <- "[Das eigenverantwortliche Lernen wird durch das Gesamtkonzept gefördert.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 7] <- factor(data[, 7], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[7] <- "G1Q00001_2"
# LimeSurvey Field type: F
data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "[Ich hätte die Dozenten gerne häufiger in der Aula erlebt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 8] <- factor(data[, 8], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[8] <- "G1Q00001_3"
# LimeSurvey Field type: F
data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "[Die Mentoren konnten uns bei der Klärung von inhaltlichen Fragen angemessen unterstützen.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 9] <- factor(data[, 9], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[9] <- "G1Q00001_4"
# LimeSurvey Field type: F
data[, 10] <- as.numeric(data[, 10])
attributes(data)$variable.labels[10] <- "[Die Unterstützung durch die Mentoren als Tandem war vorteilhaft.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 10] <- factor(data[, 10], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[10] <- "G1Q00001_5"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "[Die Mentoren konnten mich bei Fragen in Bezug auf das Studium unterstützen.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 11] <- factor(data[, 11], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[11] <- "G1Q00001_6"
# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "[Der Lerngewinn der Veranstaltung war sehr hoch.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 12] <- factor(data[, 12], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[12] <- "G1Q00001_7"
# LimeSurvey Field type: F
data[, 13] <- as.numeric(data[, 13])
attributes(data)$variable.labels[13] <- "[Die Einführung der Mentoren in den Umgang mit wissenschaftlichen Texten war für mich sehr hilfreich.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 13] <- factor(data[, 13], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[13] <- "G1Q00001_8"
# LimeSurvey Field type: F
data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "[Die kritische Auseinandersetzung und Reflexion wurde durch das Gesamtkonzept begünstigt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 14] <- factor(data[, 14], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[14] <- "G1Q00001_9"
# LimeSurvey Field type: F
data[, 15] <- as.numeric(data[, 15])
attributes(data)$variable.labels[15] <- "[Ohne Klausur hätte ich mich mit den Inhalten der Veranstaltung genauso intensiv auseinandergesetzt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 15] <- factor(data[, 15], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[15] <- "G1Q00001_10"
# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[Die Gesamtveranstaltung hat mein Interesse an erziehungswissenschaftlichen Fragen geweckt.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 16] <- factor(data[, 16], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[16] <- "G1Q00001_11"
# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Mit der Organisation der Gesamtveranstaltung war ich jederzeit zufrieden.] Die nachstehenden Aussagen beziehen sich auf Die Veranstaltung »Erziehungswissenschaftliche Grundfragen pädagogischen Denkens und Handelns«. Bitte antworten Sie nach Ihrem ersten Eindruck."
data[, 17] <- factor(data[, 17], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[17] <- "G1Q00001_12"
# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "[Der Zeitaufwand für die Vorbereitung im Vergleich zu anderen Fächern war angemessen.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data[, 18] <- factor(data[, 18], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[18] <- "G2Q00001_1"
# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[Ich hatte genug Zeit, um mich mithilfe der online-Lektionen und der Texte vorzubereiten.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data[, 19] <- factor(data[, 19], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[19] <- "G2Q00001_2"
# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[Ich hätte gerne mehr Zeit gehabt, um mich mit den Themen zu beschäftigen.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data[, 20] <- factor(data[, 20], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[20] <- "G2Q00001_3"
# LimeSurvey Field type: F
data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[21] <- "[Ich stelle oft Dinge in Frage, die ich in Vorlesungen höre oder in Büchern lese.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data[, 21] <- factor(data[, 21], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[21] <- "G2Q00001_4"
# LimeSurvey Field type: F
data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[Dinge, die ich in dieser Lehrveranstaltung höre oder lese, hinterfrage ich, um entscheiden zu können, ob ich sie überzeugend finde.] Die folgenden Aussagen beziehen sich auf Ihr eigenes Lernen."
data[, 22] <- factor(data[, 22], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[22] <- "G2Q00001_5"
# LimeSurvey Field type: F
data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[Ich konnte die Web-App problemlos bedienen.] Die folgenden Aussagen beziehen sich auf die Web-App."
data[, 23] <- factor(data[, 23], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[23] <- "G3Q00001_1"
# LimeSurvey Field type: F
data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[Die Web-App ist sehr übersichtlich gestaltet.] Die folgenden Aussagen beziehen sich auf die Web-App."
data[, 24] <- factor(data[, 24], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[24] <- "G3Q00001_2"
# LimeSurvey Field type: F
data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "[Durch die Web-App war ich immer sehr gut informiert.] Die folgenden Aussagen beziehen sich auf die Web-App."
data[, 25] <- factor(data[, 25], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[25] <- "G3Q00001_3"
# LimeSurvey Field type: F
data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[Die Notizfunktion war völlig überflüssig.] Die folgenden Aussagen beziehen sich auf die Web-App."
data[, 26] <- factor(data[, 26], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[26] <- "G3Q00001_4"
# LimeSurvey Field type: F
data[, 27] <- as.numeric(data[, 27])
attributes(data)$variable.labels[27] <- "[Die online-Lektionen zusammen mit den Plenumsveranstaltungen und Mentoriaten bevorzuge ich im Vergleich zu einer herkömmlichen Präsenz-Vorlesung mit ca. 300–400 Studierenden.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 27] <- factor(data[, 27], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[27] <- "G4Q00001_1"
# LimeSurvey Field type: F
data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "[Die Verfügbarkeit des Online-Formats kommt mir entgegen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 28] <- factor(data[, 28], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[28] <- "G4Q00001_2"
# LimeSurvey Field type: F
data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Die Dauer der Online-Vorlesungen ist sehr angemessen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 29] <- factor(data[, 29], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[29] <- "G4Q00001_3"
# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Verglichen mit 90 minütigen Präsenzvorlesungen habe ich in den kürzeren online-Lektionen mehr gelernt.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 30] <- factor(data[, 30], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[30] <- "G4Q00001_4"
# LimeSurvey Field type: F
data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Beim Abspielen der online-Lektionen hatte ich immer wieder Probleme.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 31] <- factor(data[, 31], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[31] <- "G4Q00001_5"
# LimeSurvey Field type: F
data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Wenn ja, konnten diese Probleme mit Unterstützung durch die Veranstalter schnell gelöst werden.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 32] <- factor(data[, 32], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[32] <- "G4Q00001_6"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Die ca. 30 minütigen online-Lektionen stellen für mich im Vergleich zu 90 minütigen Präsenzvorlesungen eine Zeitersparnis dar.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 33] <- factor(data[, 33], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[33] <- "G4Q00001_7"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "[Die Unabhängigkeit von festen Vorlesungsterminen kam mir sehr entgegen.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 34] <- factor(data[, 34], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[34] <- "G4Q00001_8"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "[Die Möglichkeit des Zurückspulens, Anhaltens und Wiederholen stellt für mich einen erheblichen Vorteil dar.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 35] <- factor(data[, 35], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[35] <- "G4Q00001_9"
# LimeSurvey Field type: F
data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[36] <- "[Die Abhängigkeit vom Internet war für mich ein großer Nachteil.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 36] <- factor(data[, 36], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[36] <- "G4Q00001_10"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[Dass die Vorlesungen von vier Dozenten gehalten wurden (und nicht von einem) ist sinnvoll.] Die nachfolgenden Aussagen beziehen sich auf die online-Lektionen."
data[, 37] <- factor(data[, 37], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[37] <- "G4Q00001_11"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[Sozialgeschichte der Erziehung und Bildung] Die Gestaltung der Videos finde ich sehr gelungen."
data[, 38] <- factor(data[, 38], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[38] <- "G4Q00002_1"
# LimeSurvey Field type: F
data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die Gestaltung der Videos finde ich sehr gelungen."
data[, 39] <- factor(data[, 39], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[39] <- "G4Q00002_2"
# LimeSurvey Field type: F
data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[40] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die Gestaltung der Videos finde ich sehr gelungen."
data[, 40] <- factor(data[, 40], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[40] <- "G4Q00002_3"
# LimeSurvey Field type: F
data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "[Erziehung und Schule] Die Gestaltung der Videos finde ich sehr gelungen."
data[, 41] <- factor(data[, 41], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[41] <- "G4Q00002_4"
# LimeSurvey Field type: F
data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "[Bildung – Glück – Gerechtigkeit] Die Gestaltung der Videos finde ich sehr gelungen."
data[, 42] <- factor(data[, 42], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[42] <- "G4Q00002_5"
# LimeSurvey Field type: F
data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[43] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data[, 43] <- factor(data[, 43], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[43] <- "G4Q00003_1"
# LimeSurvey Field type: F
data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data[, 44] <- factor(data[, 44], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[44] <- "G4Q00003_2"
# LimeSurvey Field type: F
data[, 45] <- as.numeric(data[, 45])
attributes(data)$variable.labels[45] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data[, 45] <- factor(data[, 45], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[45] <- "G4Q00003_3"
# LimeSurvey Field type: F
data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Erziehung und Schule] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data[, 46] <- factor(data[, 46], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[46] <- "G4Q00003_4"
# LimeSurvey Field type: F
data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen haben mir einen Einblick in erziehungswissenschaftliche Grundfragen gegeben."
data[, 47] <- factor(data[, 47], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[47] <- "G4Q00003_5"
# LimeSurvey Field type: F
data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[Sozialgeschichte der Erziehung und Bildung] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data[, 48] <- factor(data[, 48], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[48] <- "G4Q00004_1"
# LimeSurvey Field type: F
data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data[, 49] <- factor(data[, 49], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[49] <- "G4Q00004_2"
# LimeSurvey Field type: F
data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data[, 50] <- factor(data[, 50], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[50] <- "G4Q00004_3"
# LimeSurvey Field type: F
data[, 51] <- as.numeric(data[, 51])
attributes(data)$variable.labels[51] <- "[Erziehung und Schule] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data[, 51] <- factor(data[, 51], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[51] <- "G4Q00004_4"
# LimeSurvey Field type: F
data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Bildung – Glück – Gerechtigkeit] Die Inhalte der online-Lektionen waren vom Schwierigkeitsgrad her zu anspruchsvoll."
data[, 52] <- factor(data[, 52], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[52] <- "G4Q00004_5"
# LimeSurvey Field type: F
data[, 53] <- as.numeric(data[, 53])
attributes(data)$variable.labels[53] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen waren gut strukturiert."
data[, 53] <- factor(data[, 53], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[53] <- "G4Q00005_1"
# LimeSurvey Field type: F
data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen waren gut strukturiert."
data[, 54] <- factor(data[, 54], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[54] <- "G4Q00005_2"
# LimeSurvey Field type: F
data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen waren gut strukturiert."
data[, 55] <- factor(data[, 55], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[55] <- "G4Q00005_3"
# LimeSurvey Field type: F
data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Erziehung und Schule] Die online-Lektionen waren gut strukturiert."
data[, 56] <- factor(data[, 56], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[56] <- "G4Q00005_4"
# LimeSurvey Field type: F
data[, 57] <- as.numeric(data[, 57])
attributes(data)$variable.labels[57] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen waren gut strukturiert."
data[, 57] <- factor(data[, 57], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[57] <- "G4Q00005_5"
# LimeSurvey Field type: F
data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Sozialgeschichte der Erziehung und Bildung] Die online-Lektionen war vom Umfang her angemessen."
data[, 58] <- factor(data[, 58], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[58] <- "G4Q00006_1"
# LimeSurvey Field type: F
data[, 59] <- as.numeric(data[, 59])
attributes(data)$variable.labels[59] <- "[Ideen- und Personengeschichte der Pädagogik (Rainer Bolle: Rousseau)] Die online-Lektionen war vom Umfang her angemessen."
data[, 59] <- factor(data[, 59], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[59] <- "G4Q00006_2"
# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Ideen- und Personengeschichte der Pädagogik (Gabriele Weigand: Pestalozzi & Humboldt)] Die online-Lektionen war vom Umfang her angemessen."
data[, 60] <- factor(data[, 60], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[60] <- "G4Q00006_3"
# LimeSurvey Field type: F
data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[Erziehung und Schule] Die online-Lektionen war vom Umfang her angemessen."
data[, 61] <- factor(data[, 61], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[61] <- "G4Q00006_4"
# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[Bildung – Glück – Gerechtigkeit] Die online-Lektionen war vom Umfang her angemessen."
data[, 62] <- factor(data[, 62], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[62] <- "G4Q00006_5"
# LimeSurvey Field type: F
data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[Die methodische Vorgehensweise im Mentoriat war immer klar und transparent.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data[, 63] <- factor(data[, 63], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[63] <- "G5Q00001_1"
# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[Durch die verschiedenen Arbeitsweisen und Themenschwerpunkte in den anderen Mentoriaten war ich verunsichert.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data[, 64] <- factor(data[, 64], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[64] <- "G5Q00001_2"
# LimeSurvey Field type: F
data[, 65] <- as.numeric(data[, 65])
attributes(data)$variable.labels[65] <- "[Die methodische Vielfalt in den Mentoriaten hat mir die Bearbeitung der Inhalte wesentlich erleichtert.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data[, 65] <- factor(data[, 65], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[65] <- "G5Q00001_3"
# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[Ich würde gerne selbst Mentorin bzw. Mentor werden.] Die nachfolgenden Aussagen beziehen sich auf die Mentoriate."
data[, 66] <- factor(data[, 66], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[66] <- "G5Q00001_4"
# LimeSurvey Field type: F
data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "[Die \"Häufig gestellten Fragen\"-Vorlesungen waren hilfreich, um offene Fragen zu klären.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data[, 67] <- factor(data[, 67], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[67] <- "G6Q00001_1"
# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[68] <- "[Die \"Häufig gestellten Fragen\"-Vorlesungen waren überflüssig, da ich keine offenen Fragen hatte.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data[, 68] <- factor(data[, 68], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[68] <- "G6Q00001_2"
# LimeSurvey Field type: F
data[, 69] <- as.numeric(data[, 69])
attributes(data)$variable.labels[69] <- "[Ich habe alle meine offenen Fragen an die Mentoren weitergegeben.] Die nachfolgenden Aussagen beziehen sich auf die Plenumsveranstaltungen."
data[, 69] <- factor(data[, 69], levels=c(1,2,3,4,5,6),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[69] <- "G6Q00001_3"
# LimeSurvey Field type: A
data[, 70] <- as.character(data[, 70])
attributes(data)$variable.labels[70] <- "[Timo Hoyer (2005): Ethik und Moralerziehung] Wie verständlich fanden Sie die Texte?"
data[, 70] <- factor(data[, 70], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[70] <- "G7Q00001_1"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[71] <- "[Oskar Negt (1997): Vom Kindheitsmythos zur Lebenswelt der Kinder] Wie verständlich fanden Sie die Texte?"
data[, 71] <- factor(data[, 71], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[71] <- "G7Q00001_2"
# LimeSurvey Field type: A
data[, 72] <- as.character(data[, 72])
attributes(data)$variable.labels[72] <- "[Heinz-Elmar Tenorth (1988): Geschichte der Erziehung] Wie verständlich fanden Sie die Texte?"
data[, 72] <- factor(data[, 72], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[72] <- "G7Q00001_3"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[73] <- "[Auszug aus »Émile« (1762) und »Julie« (1761)] Wie verständlich fanden Sie die Texte?"
data[, 73] <- factor(data[, 73], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[73] <- "G7Q00001_4"
# LimeSurvey Field type: A
data[, 74] <- as.character(data[, 74])
attributes(data)$variable.labels[74] <- "[Auszug aus dem »Stanser Brief« (1807)] Wie verständlich fanden Sie die Texte?"
data[, 74] <- factor(data[, 74], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[74] <- "G7Q00001_5"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[75] <- "[Auszug aus dem »Königsberger« und dem »Litauischer Schulplan« (1809)] Wie verständlich fanden Sie die Texte?"
data[, 75] <- factor(data[, 75], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[75] <- "G7Q00001_6"
# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[76] <- "[Franz Kafka (1919): Brief an den Vater] Wie verständlich fanden Sie die Texte?"
data[, 76] <- factor(data[, 76], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[76] <- "G7Q00001_7"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[77] <- "[Richard von Weizsäcker (1993): Ansprache bei der Eröffnungsveranstaltung der Tagung der Bundesarbeitsgemeinschaft Hilfe für Behinderte] Wie verständlich fanden Sie die Texte?"
data[, 77] <- factor(data[, 77], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[77] <- "G7Q00001_8"
# LimeSurvey Field type: A
data[, 78] <- as.character(data[, 78])
attributes(data)$variable.labels[78] <- "[Konrad Paul Liessmann (2006): Theorie der Unbildung] Wie verständlich fanden Sie die Texte?"
data[, 78] <- factor(data[, 78], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[78] <- "G7Q00001_9"
# LimeSurvey Field type: A
data[, 79] <- as.character(data[, 79])
attributes(data)$variable.labels[79] <- "[Timo Hoyer (2011): Glück soll lernbar sein? Ist es aber nicht!] Wie verständlich fanden Sie die Texte?"
data[, 79] <- factor(data[, 79], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[79] <- "G7Q00001_10"
# LimeSurvey Field type: A
data[, 80] <- as.character(data[, 80])
attributes(data)$variable.labels[80] <- "[Krassimir Stojanov (2011): Bildungsgerechtigkeit] Wie verständlich fanden Sie die Texte?"
data[, 80] <- factor(data[, 80], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("absolut verständlich", "gut verständlich", "eher verständlich", "eher unverständlich", "ziemlich unverständlich", "total unverständlich"))
names(data)[80] <- "G7Q00001_11"
# LimeSurvey Field type: A
data[, 81] <- as.character(data[, 81])
attributes(data)$variable.labels[81] <- "[Widersprüche zwischen den Texten und den online-Lektionen haben mich sehr irritiert.] Aussagen in Bezug auf den Umgang mit den Texten."
data[, 81] <- factor(data[, 81], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[81] <- "G7Q00002_1"
# LimeSurvey Field type: A
data[, 82] <- as.character(data[, 82])
attributes(data)$variable.labels[82] <- "[Durch die Textarbeit hat sich mein Verständnis von erziehungswissenschaftlichen Fragen erweitert.] Aussagen in Bezug auf den Umgang mit den Texten."
data[, 82] <- factor(data[, 82], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("trifft überhaupt nicht zu", "trifft kaum zu", "trifft teilweise nicht zu", "trifft teilweise zu", "trifft weitgehend zu", "trifft voll zu"))
names(data)[82] <- "G7Q00002_2"
# LimeSurvey Field type: F
data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[83] <- "Wie groß war die wöchentliche Vorbereitungzeit bzgl. der Texte?"
names(data)[83] <- "G7Q00003"
# LimeSurvey Field type: 
data[, 84] <- as.numeric(data[, 84])
attributes(data)$variable.labels[84] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 85] <- as.numeric(data[, 85])
attributes(data)$variable.labels[85] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[87] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[89] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[90] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 91] <- as.numeric(data[, 91])
attributes(data)$variable.labels[91] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[92] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[93] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[94] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[95] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[96] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[97] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[98] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[99] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 100] <- as.numeric(data[, 100])
attributes(data)$variable.labels[100] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[101] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[102] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[103] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[104] <- ""
#sql_name not set
# LimeSurvey Field type: 
data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[105] <- ""
#sql_name not set
