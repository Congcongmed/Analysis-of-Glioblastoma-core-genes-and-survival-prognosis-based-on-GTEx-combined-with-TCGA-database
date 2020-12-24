###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056

#install.packages("ggpubr")

library(ggpubr)

setwd("C:\\others\\yangfan\\caogao2\\06.boxplot")               #���ù���Ŀ¼
rt=read.table("expSite.txt",sep="\t",header=T,check.names=F)       #��ȡ�����ļ�

#���ƻ�����������Ʒ��boxplot
p=ggboxplot(rt, x="organ", y="value", color = "organ",
       palette = rainbow(length(levels(rt$organ))),
       ylab="Gene expression",
       xlab="",
       #add = "jitter",                                            #����ÿ����Ʒ��ɢ��
       legend = "right")
pdf(file="boxplot.pdf",width=12,height=6)                          #���ͼƬ�ļ�
p+rotate_x_text(60)
dev.off()

#������Ů�ֱ����
p=ggboxplot(rt, x="organ", y="value", color = "Gender", 
     ylab="Gene expression",
     xlab="",
     #add = "jitter",                                              #����ÿ����Ʒ��ɢ��
     palette = c("green","red") )
p=p+stat_compare_means(aes(group=Gender), 
    label = "p.signif",
    symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", " ")))
p=p+rotate_x_text(60)
pdf(file="boxplot.group.pdf",width=8,height=5)                       #���ͼƬ�ļ�
p
dev.off()

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056