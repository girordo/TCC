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
library(ggplot2)
```

### Técnica de Bootstrapping
É um método de reamostragem proposto por Bradley Efron em 1979. Utiliza-se para aproximar distribuição na amostra de um levantamento estatístico. Usa-se frequentemente para aproximar o viés ou a variância de um conjunto de dados estatísticos, assim como para construir intervalos de confiança ou realizar contrastes de hipóteses sobre parâmetros de interesse. Na maior parte dos casos não pode obter-se expressões fechadas para as aproximações bootstrap e portanto é necessário obter reamostragens em um ordenador para por em prática o método. A enorme capacidade de cálculo dos computadores atuais facilita consideravelmente a aplicabilidade deste método tão custoso computacionalmente.

### Aprendizado de Máquina
É uma área de I.A. cujo objetivo é o desenvolvimento de técnicas computacionais sobre o aprendizado bem como a construção de sistemas capazes de adquirir conhecimento de forma automática. Um sistema de aprendizado é um programa de computador que toma decisões baseado em experiências acumuladas através da solução bem sucedida de problemas anteriores. Os diversos sistemas de aprendizado de máquina possuem características particulares e comuns que possibilitam sua classificação quanto à linguagem de descrição, modo, paradigma e forma de aprendizado utilizado.

### Aprendizado não supervisionado
A indução é a forma de inferência lógica que permite obter conclusões genéricas sobre um conjunto particular de exemplos. Ela é caracterizada como o raciocínio que se origina em um conceito específico e o generaliza, ou seja, da parte para o todo.  Na indução, um conceito é aprendido efetuando-se inferência indutiva sobre os exemplos apresentados.  Portanto, as hipóteses geradas através da inferência indutiva podem ou não preservar a verdade.Mesmo assim, a inferência indutiva é um dos principais métodos utilizados para derivar conhecimento novo e predizer eventos futuros. Apesar da indução ser o recurso mais utilizado pelo cérebro humano para derivar conhecimento novo, ela deve ser utilizada com cautela, pois se o número de exemplos for insuficiente,ou se os exemplos não forem bem escolhidos, as hipóteses obtidas podem ser de pouco valor. O aprendizado indutivo é efetuado a partir de raciocínio sobre exemplos fornecidos por um processo externo ao sistema de aprendizado.  O aprendizado indutivo pode ser dividido em supervisionado e não-supervisionado.
No aprendizado não-supervisionado, o indutor analisa os exemplos fornecidos e tenta determinar se alguns deles podem ser agrupados de alguma maneira, formando agrupamentos ou clusters. Após a determinação dos agrupamentos, normalmente,é necessária uma análise para determinar o que cada agrupamento significa no contexto do problema que está sendo analisado.
