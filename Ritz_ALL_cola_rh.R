setwd("/omics/groups/OE0246/internal/guz/cola_hc/examples/Ritz_ALL")
library(cola)

library(ALL)
data(ALL)

m = exprs(ALL)
anno = pData(ALL)
anno = anno[, c("sex", "age", "BT")]

m = adjust_matrix(m)

library(preprocessCore)
cn = colnames(m)
rn = rownames(m)
m = normalize.quantiles(m)
colnames(m) = cn
rownames(m) = rn

rh = hierarchical_partition(m, cores = 4, anno = anno)
saveRDS(rh, file = "Ritz_ALL_cola_rh.rds")

cola_report(rh, output = "Ritz_ALL_cola_rh_report", title = "cola Report for Hierarchical Partitioning - 'Ritz_ALL'")
