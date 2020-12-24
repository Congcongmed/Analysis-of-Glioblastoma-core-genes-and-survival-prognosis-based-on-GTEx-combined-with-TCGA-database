###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056

#install.packages("digest")
#install.packages("GOplot")

library(GOplot)
setwd("C:\\others\\yangfan\\caogao2\\19.KEGGplot")              #设置工作目录

ego=read.table("kegg.txt", header = T,sep="\t",check.names=F)      #读取kegg富集结果文件
go=data.frame(Category = "All",ID = ego$ID,Term = ego$Description, Genes = gsub("/", ", ", ego$geneID), adj_pval = ego$p.adjust)

#读取基因的logFC文件
id.fc <- read.table("id.txt", header = T,sep="\t",check.names=F)
genelist <- data.frame(ID = id.fc$gene, logFC = id.fc$logFC)
row.names(genelist)=genelist[,1]

circ <- circle_dat(go, genelist)
termNum = 3                                     #限定term数目
geneNum = nrow(genelist)                        #限定基因数目

chord <- chord_dat(circ, genelist[1:geneNum,], go$Term[1:termNum])
pdf(file="circ.pdf",width = 9,height = 8)
GOChord(chord, 
        space = 0.001,           #基因之间的间距
        gene.order = 'logFC',    #按照logFC值对基因排序
        gene.space = 0.25,       #基因名跟圆圈的相对距离
        gene.size = 4,           #基因名字体大小 
        border.size = 0.1,       #线条粗细
        process.label = 9)     #term字体大小
dev.off()

termCol <- c("#223D6C","#D20A13","#FFD121","#088247","#58CDD9","#7A142C","#5D90BA","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767")
pdf(file="cluster.pdf",width = 9,height = 8)
GOCluster(circ.gsym, 
          go$Term[1:termNum], 
          lfc.space = 0.2,                   #倍数跟树间的空隙大小
          lfc.width = 1,                     #变化倍数的圆圈宽度
          term.col = termCol[1:termNum],     #自定义term的颜色
          term.space = 0.2,                  #倍数跟term间的空隙大小
          term.width = 1)                    #富集term的圆圈宽度
dev.off()          

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######生信自学网: http://www.biowolf.cn/
######合作邮箱：2749657388@qq.com
######答疑微信: 18520221056