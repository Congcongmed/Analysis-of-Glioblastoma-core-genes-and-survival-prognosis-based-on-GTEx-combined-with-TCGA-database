###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056

#install.packages("ggpubr")

library(ggpubr)

setwd("C:\\others\\yangfan\\caogao2\\06.boxplot")               #设置工作目录
rt=read.table("expSite.txt",sep="\t",header=T,check.names=F)       #读取输入文件

#绘制基因在所有样品的boxplot
p=ggboxplot(rt, x="organ", y="value", color = "organ",
       palette = rainbow(length(levels(rt$organ))),
       ylab="Gene expression",
       xlab="",
       #add = "jitter",                                            #绘制每个样品的散点
       legend = "right")
pdf(file="boxplot.pdf",width=12,height=6)                          #输出图片文件
p+rotate_x_text(60)
dev.off()

#根据男女分别绘制
p=ggboxplot(rt, x="organ", y="value", color = "Gender", 
     ylab="Gene expression",
     xlab="",
     #add = "jitter",                                              #绘制每个样品的散点
     palette = c("green","red") )
p=p+stat_compare_means(aes(group=Gender), 
    label = "p.signif",
    symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", " ")))
p=p+rotate_x_text(60)
pdf(file="boxplot.group.pdf",width=8,height=5)                       #输出图片文件
p
dev.off()

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056