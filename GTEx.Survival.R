###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056

#install.packages("survival")

setwd("C:\\others\\yangfan\\caogao2\\14.survival")    #����Ŀ¼�����޸ģ�
library(survival)
pFilter=0.05                                                #����ͼ��̫�ֻ࣬��pС��0.05�Ļ����ͼ
rt=read.table("expTime.txt",header=T,sep="\t",check.names=F)    #��ȡ�����ļ�
rt$futime=rt$futime/365                                     #�������Ϊ��λ������30������Ϊ��λ������365
outTab=data.frame()

for(gene in colnames(rt[,4:ncol(rt)])){
  
  a=rt[,gene]<=median(rt[,gene])
  diff=survdiff(Surv(futime, fustat) ~a,data = rt)
  pValue=1-pchisq(diff$chisq,df=1)
  outTab=rbind(outTab,cbind(gene=gene,pvalue=pValue))

  fit <- survfit(Surv(futime, fustat) ~ a, data = rt)
  summary(fit)

  if(pValue<pFilter){
	  if(pValue<0.001){
	      pValue=signif(pValue,4)
	      pValue=format(pValue, scientific = TRUE)
	  }else{
	      pValue=round(pValue,3)
	  }
	  pdf(file=paste(gene,".survival.pdf",sep=""),
	      width = 5.5,            #ͼƬ�Ŀ���
	      height =5,              #ͼƬ�ĸ߶�	      
	  )
	  plot(fit, 
	     lwd=2,
	     col=c("red","blue"),
	     xlab="Time (year)",
	     mark.time=T,
	     ylab="Survival rate",
	     ylim=c(0,1.09),
	     main=paste("Survival curve (p=", pValue ,")",sep=""))
	  legend("topright", 
	       c(paste(gene," high expression",sep=""), 
	       paste(gene," low expression",sep="") ), 
	       lwd=2, 
	       col=c("red","blue"))
	  dev.off()
	}
}
write.table(outTab,file="survival.xls",sep="\t",row.names=F,quote=F)    #��������pֵ�����ļ�

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056