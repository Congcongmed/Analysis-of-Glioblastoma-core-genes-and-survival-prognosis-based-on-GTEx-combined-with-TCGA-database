###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056

#install.packages("pheatmap")

setwd("C:\\others\\yangfan\\caogao2\\12.heatmap")      #设置工作目录
data=read.table("diffGeneExp.txt",sep="\t",header=T,row.names=1,check.names=F)
Rank <- ceiling(rank(data, ties.method="first")/ceiling(nrow(data)*ncol(data)/10))
dimnames1=list(rownames(data),colnames(data))
rt=matrix(as.numeric(as.matrix(Rank)),nrow=nrow(data),dimnames=dimnames1)

library(pheatmap)
Type=c(rep("con",1157),rep("treat",168))    #修改对照和处理组样品数目
names(Type)=colnames(rt)
Type=as.data.frame(Type)

pdf("heatmap.pdf",height=15,width=20)     #保存输出结果
pheatmap(rt, 
         annotation=Type, 
         show_colnames=F,
         color = colorRampPalette(c("green", "black", "red"))(50),
         cluster_cols =F,
         fontsize = 10,
         fontsize_row=1,
         fontsize_col=3)
dev.off()

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056