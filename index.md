
## Hierarchical consensus partitioning analysis on dataset 'Ritz_ALL'

Runnable code:

```r
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
```

[The HTML report is here.](https://cola-rh.github.io/Ritz_ALL/Ritz_ALL_cola_rh_report/cola_hc.html) (generated by __cola__ version 2.0.0, R 4.1.0.)
