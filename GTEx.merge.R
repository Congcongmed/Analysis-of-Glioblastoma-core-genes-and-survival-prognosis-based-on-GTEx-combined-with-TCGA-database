###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056

#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("limma")

library(limma)
setwd("C:\\others\\yangfan\\caogao2\\10.merge")         #���ù���Ŀ¼

#��ȡGTEx�ļ�������������
rt1=read.table("GTExNormalExp.txt",sep="\t",header=T,check.names=F)
rt1=as.matrix(rt1)
rownames(rt1)=rt1[,1]
exp1=rt1[,2:ncol(rt1)]
dimnames1=list(rownames(exp1),colnames(exp1))
data1=matrix(as.numeric(as.matrix(exp1)),nrow=nrow(exp1),dimnames=dimnames1)
data1=avereps(data1)

#��ȡTCGA�ļ�������������
rt2=read.table("tcgaSymbol.txt",sep="\t",header=T,check.names=F)
rt2=as.matrix(rt2)
rownames(rt2)=rt2[,1]
exp2=rt2[,2:ncol(rt2)]
dimnames2=list(rownames(exp2),colnames(exp2))
data2=matrix(as.numeric(as.matrix(exp2)),nrow=nrow(exp2),dimnames=dimnames2)
data2=avereps(data2)

#�Ի���ȡ����
sameGene=intersect( row.names(data1),row.names(data2) )
data=cbind(data1[sameGene,],data2[sameGene,])

#���ݽ���
outTab=normalizeBetweenArrays(data)
outTab=rbind(geneNames=colnames(outTab),outTab)
write.table(outTab,file="merge.txt",sep="\t",quote=F,col.names=F)

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056