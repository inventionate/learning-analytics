barplot(res$eig[,2], names.arg = 1:nrow(res$eig))
drawn <-
c("77", "84", "86", "100", "29", "2", "12", "68", "35", "76", 
"41", "79", "28", "42", "94", "67")
plot.MCA(res, select = drawn, axes = 1:2, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("Videoaktivitäten: very few", "Gesamtaktionen: very few", 
"Gesamtevents: very few", "Pausen: very few", "Abspielungen: very few", 
"Videoaktivitäten: very many", "Gesamtaktionen: very many", 
"Gesamtevents: very many", "Pausen: very many", "Abspielungen: very many", 
"Besuchszeit: very long", "Besuchszeit: very short", "Sprünge: very few", 
"Sprünge: very many", "Fähnchensprünge: very few")
plot.MCA(res, selectMod = drawn, axes = 1:2, choix = 'ind', invisible = 'ind', title = '', cex = cex)
drawn <-
c("52", "20", "75", "1", "51", "70", "5", "30", "80", "99", "98", 
"59", "32", "49", "56", "72")
plot.MCA(res, select = drawn, axes = 3:4, choix = 'ind', invisible = c('var', 'quali'), title = '', cex = cex)
drawn <-
c("Gesamtaktionen: many", "Gesamtevents: many", "Videoaktivitäten: many", 
"Pausen: many", "Abspielungen: many", "Pausen: few", "Abspielungen: few", 
"Gesamtbesuche: very few", "Gesamtevents: few", "Gesamtaktionen: few"
)
plot.MCA(res, selectMod = drawn, axes = 3:4, choix = 'ind', invisible = 'ind', title = '', cex = cex)
res.hcpc = HCPC(res, nb.clust = -1, graph = FALSE)
drawn <-
c("77", "84", "86", "100", "29", "2", "12", "68", "35", "76", 
"41", "79", "28", "42", "94", "67")
plot.HCPC(res.hcpc, choice = 'map', draw.tree = FALSE, select = drawn, title = '')
