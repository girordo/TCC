<p align="center">
<img src="https://sites.usp.br/fmrpnew/wp-content/uploads/sites/356/2018/05/Brasao_Flamula.png" width="150px" height="150px">
</p>

# TCC
Expressão Gênica no Cérebro Autista:
Reanálise de Dados Públicos em Busca de Robustez no Aprendizado de Máquina Não-supervisionado

## Objetivos
Consiste em baixar dados públicos sobre a expressão gênica em pacientes autistas via GEO Datasets. Após isto verificaríamos a existência de outros grupos além dos abordados pelo artigo, os subgrupos. E para isso funcionar utilizaríamos aprendizado de máquina não supervisionado para criarmos esses subgrupos. Também tem como intuito melhorar as habilidades em bioinformática e análise de dados do aluno.
Coaduna com a proposta do curso de Informática Biomédica propõe seguindo a interdisciplinaridade das duas áreas propostas pelo curso:ciências exatas e ciências médicas.

### Transtorno do Espectro Autista
O TEA é um transtorno pervasivo que traz significativos impactos na qualidade de vida dos acometidos. Para o diagnóstico TEA, cujo código CID é CID-10 F 84 mas normalmente utiliza-se o guia do manual norte-americano DSM-5, exige-se comprometimento em habilidades sociais e existência de comportamentos repetitivos, não sendo mais necessária ausência de fala. A Figura 01 abaixo resume o diagnóstico bem como as comorbidades mais frequentes, muitas vezes elas as mais comprometedoras na qualidade de vida e dia-a-dia dos acometidos.

## Material de estudo
Serão analisadas os datasets públicos do tipo .soft referentes ao artigo Transcriptomic analysis of autistic brain reveals convergent molecular pathology
obtidos a partir do GEO Datasets.

### Bibliotecas utilizadas
```
library(GEOquery)
library(dplyr)
library(pvclust)
library(HotDeckImputation)
library(ConsensusClusterPlus)
library(ComplexHeatmap)
library(ggplot2)
```
