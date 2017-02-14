
fviz_gda_var(mca_res, axes = c(1,2), title = "Learning Analytics — e:t:p:M@Math") + 
  geom_hline(yintercept = 0, color = "grey", linetype="solid") +
  geom_vline(xintercept = 0, color = "grey", linetype="solid") +
  theme(panel.grid = element_line(colour = "grey", size = 1.5))

ggsave("Kategorien.pdf", width = 11, height = 8)
fviz_gda_var(mca_res, axes = c(2,3), group = group, group_names = group_names, title = "Learning Analytics — e:t:p:M@Math")

# Notizen als strukturierender Faktor
fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "visit_event_action_notes", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "visit_event_action_notes", impute = FALSE)

fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "average_visit_hour", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "average_visit_hour", impute = FALSE)

fviz_gda_quali_ellipses(mca_res, datensatz_synthesise_users_gda, "average_visit_devices", impute = FALSE)
fviz_gda_quali_supvar(mca_res, datensatz_synthesise_users_gda, "average_visit_devices", impute = FALSE)

# HCPC

hcpc_res <- HCPC(mca_res, nb.clust = 3, graph = FALSE)

fviz_gda_quali_ellipses(mca_res, hcpc_res$data.clust, "clust", title = "Learning Analytics — e:t:p:M@Math — Cluster")
ggsave("Cluster.pdf", width = 8, height = 3)


# 3D

get_colors <- function(groups, group.col = palette()){
  groups <- as.factor(groups)
  ngrps <- length(levels(groups))
  if(ngrps > length(group.col)) 
    group.col <- rep(group.col, ngrps)
  color <- group.col[as.numeric(groups)]
  names(color) <- as.vector(groups)
  return(color)
}

x <- mca_res$ind$coord[,1]
y <- mca_res$ind$coord[,2]
z <- mca_res$ind$coord[,3]

groups <- hcpc_res$data.clust$clust
levs <- levels(groups)
group_col <- brewer.pal(n = length(levs), name="Set1")

# Open RGL device
open3d(windowRect = c(0, 0, 1000, 1000))

# Scatter plot
spheres3d(x, y, z, r = 0.03, color = get_colors(groups, group_col))

# Axes
lines3d(c(-1, 1), c(0, 0), c(0, 0), color = "black")
lines3d(c(0, 0), c(-1,1), c(0, 0), color = "black")
lines3d(c(0, 0), c(0, 0), c(-1,1), color = "black")

# Container
bbox3d(color=c("#333333","black"), emission="#999999", specular="#333333",
       xlen=0, ylen=0, zlen=0, shininess=5, alpha=0.5)

# Ellipsis
for (i in 1:length(levs)) {
  group <- levs[i]
  selected <- groups == group
  xx <- x[selected]; yy <- y[selected]; zz <- z[selected]
  ellips <- ellipse3d(cov(cbind(xx,yy,zz)),
                      centre=c(mean(xx), mean(yy), mean(zz)), level = 0.86)
  shade3d(ellips, col = group_col[i], alpha = 0.2, lit = FALSE)
  wire3d(ellips, col = group_col[i], alpha = 0.1, lit = FALSE)
  # # show group labels
  # texts3d(mean(xx),mean(yy), mean(zz), text = group,
  #         col= group_col[i], cex = 2)
}

aspect3d(1,1,1)

# Speichern eines Bildes
rgl.viewpoint(theta = 35, phi = 15, zoom = 0.75)

rgl.snapshot("plot_3d.png")

movie3d(spin3d(axis = c(0.5, 0.5, 0.5)), duration = 15, dir = getwd())


# In Repository speichern
rmFromLocalRepo(names(asearch("name:mca_res")), removeData = TRUE, removeMiniature = TRUE)
asave(mca_res, archiveSessionInfo = FALSE)


# PCA Tests
datensatz_synthesise_users_pca <- datensatz_synthesise_users %>%
  mutate_at(vars(total_visits, total_actions, total_events), funs(as.numeric))

impute_pca <- imputePCA(datensatz_synthesise_users_pca[,-c(5,8,9)] %>% data.frame)

res_pca <- PCA(impute_pca$completeObs, graph = FALSE)

res_pca <- PCA(datensatz_synthesise_users_pca, quali.sup = c(5,8,9), graph = FALSE)

plot(res_pca)

hcpc_pca <- HCPC(res_pca, nb.clust = 3, graph = FALSE)

plot(hcpc_pca, choice="map", t.level="none", centers.plot=T)

fviz_pca_biplot(res_pca)
fviz_pca_ind(res_pca, habillage = as.factor(datensatz_synthesise_users_pca$average_visit_devices))
fviz_pca_var(res_pca, repel = TRUE)
