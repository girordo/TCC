Faremos dois testes diferentes, um substituindo os valores NA pela média dos pacientes válidos e outro omitindo os NAs
Como os grupos são altamente estratificados como apresentado no artigo, supomos que talvez com a média apareçam grupos mais próximos.
Também rodamos omitindo os valores NA pois é o protocolo padrão numa análise.
Esperamos ver as diferenças entre os dois.

Substitui os valores NA pela média dos pacientes válidos

```{r Imputando valor da media, warning=FALSE}
dados_media_NA = impute.mean(dados)
```

Omite os valores NA

```{r Omitindo valores NA, warning=FALSE}
dados_omit_NA = na.omit(dados)
```

Cálculo da média, desvio padrão e coeficiente de variação utilizando a média dos pacientes

```{r Calculo com media valida dos pacientes, warning=FALSE}
mean_with_NA <- apply(dados_media_NA,1,mean)
sd_with_NA <- apply(dados_media_NA,1,sd)
cv_with_NA <- sd_with_NA/mean_with_NA
```

Cálculo da média, desvio padrão e coeficiente de variação com os dados com NA omitidos

```{r Calculo com os NAs omitidos, warning=FALSE}
mean_with_omit_NA <- apply(dados_omit_NA,1,mean)
sd_with_omit_NA <- apply(dados_omit_NA,1,sd)
cv_with_omit_NA <- sd_with_omit_NA/mean_with_omit_NA
```

Para ter uma primeira noção de como os dados se separam entre os grupos, uma forma não-supervisionada é realizar um PCA (Análise de Componentes Principais) onde com os 2 principais componentes mais variantes é possível observar como os grupos se clusterizam.

PCA Plot dos dados com a média dos pacientes válidos

```{r PCA Plot dos dados com a média dos pacientes válidos, warning=FALSE}
pca = prcomp(t(dados_media_NA))
ggplot(data= data.frame(pca$x[,1:2]),
       aes(x = PC1, y = PC2, color= anno$"tissue (brain region):ch1", 
           shape = anno$"disease status:ch1",
           label = anno$geo_accession)) +
  geom_point(size = 3) + 
  xlab(paste0("PC1 ", prettyNum(summary(pca)$importance[2,1]*100,
                                digits = 2, decimal.mark = "."), "%")) +
  ylab(paste0("PC2 ", prettyNum(summary(pca)$importance[2,2]*100,
                                digits = 2, decimal.mark = "."), "%")) 
```

PCA Plot dos dados com os NAs omitidos

```{r PCA Plot dos dados com os NAs omitidos, warning=FALSE}
pca = prcomp(t(dados_omit_NA))
ggplot(data = data.frame(pca$x[,1:2]),
       aes(x = PC1, y = PC2, color= anno$"tissue (brain region):ch1", 
           shape = anno$"disease status:ch1",
           label = anno$geo_accession)) +
  geom_point(size = 3) + 
  xlab(paste0("PC1 ", prettyNum(summary(pca)$importance[2,1]*100,
                                digits = 2, decimal.mark = "."), "%")) +
  ylab(paste0("PC2 ", prettyNum(summary(pca)$importance[2,2]*100,
                                digits = 2, decimal.mark = "."), "%")) 
```

Heatmap com todos os dados
Não é necessária um heatmap feito com os NAs omitidos pois a função já omite automaticamente

```{r Matrix de Correlação todos os dados, warning=FALSE}
dados_cor <- as.matrix(cor(dados, use="complete.obs"))
Heatmap(dados_cor)
```

Heatmap com os dados com a média dos pacientes válidos

```{r Matrix de Correlação com média dos pacientes válidos, warning=FALSE}
dados_cor2 <- as.matrix(cor(dados_media_NA, use="complete.obs"))
Heatmap(dados_cor2)
```

Gene bottom cut do desvio padrão calculado a partir dos dados com NA omitido

```{r Seleciona genes com desvio padrão maior que 0.2054, warning=FALSE}
gene = which(sd_with_omit_NA > 0.2054) #Fiz na mão, olhando apenas os dados
geneName = rownames(dados_omit_NA)[gene]
```

PVClust Bootstrap para todos os dados com NAs omitidos

```{r Bootstrap para todos os dados com NAs omitidos, warning=FALSE}
#set.seed(123)
aux = dados_omit_NA
colnames(aux) = anno$`tissue (brain region):ch1`
colnames(aux)[0:10] <- "Cerebellum A"
colnames(aux)[11:21] <- "Cerebellum C"
colnames(aux)[22:37] <- "Frontal A"
colnames(aux)[38:53] <- "Frontal C"
colnames(aux)[54:67] <- "Temporal A"
colnames(aux2)[68:79] <- "Temporal C"
resultado_pvclust = pvclust(aux, method.dist="cor", method.hclust = "average", nboot=1000, parallel=TRUE, r=seq(.5, 1.0, by=.1))
plot(resultado_pvclust)+
  pvrect(resultado_pvclust, alpha=0.95)+
  seplot(resultado_pvclust)
```

PVclust feito por tecidos com os dados com NAs omitidos

```{r PVclust, warning=FALSE}
result_cerebellum = pvclust(aux[,0:21], method.dist="cor", method.hclust="average", nboot=1000, parallel=TRUE, r=seq(.5, 1.0, by=.1))
plot(result_cerebellum)
pvrect(result_cerebellum, alpha=0.95)
seplot(result_cerebellum)
result_frontal = pvclust(aux[,22:53], method.dist="cor", method.hclust="average", nboot=1000, parallel=TRUE, r=seq(.5, 1.0, by=.1))
plot(result_frontal)+
  pvrect(result_frontal, alpha=0.95)
seplot(result_frontal)
result_temporal = pvclust(aux[,54:79], method.dist="cor", method.hclust="average", nboot=1000, parallel=TRUE, r=seq(.5, 1.0, by=.1))
plot(result_temporal)+
  pvrect(result_temporal, alpha=0.95)
seplot(result_temporal)
```

Próximos passos
1) Método de distância é correlação
2) Método de cluster é average
3) Filtragem de dados de acordo com o capacidade computacional e tempo, pega o que mais varia pois provavelmente são os que estão mais associados com autismos
