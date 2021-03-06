###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056

#install.packages("survival")

setwd("C:\\others\\yangfan\\caogao2\\14.survival")    #工作目录（需修改）
library(survival)
pFilter=0.05                                                #由于图形太多，只对p小于0.05的基因绘图
rt=read.table("expTime.txt",header=T,sep="\t",check.names=F)    #读取输入文件
rt$futime=rt$futime/365                                     #如果以月为单位，除以30；以年为单位，除以365
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
	      width = 5.5,            #图片的宽度
	      height =5,              #图片的高度	      
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
write.table(outTab,file="survival.xls",sep="\t",row.names=F,quote=F)    #输出基因和p值表格文件

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056