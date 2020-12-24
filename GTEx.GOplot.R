###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056

#install.packages("digest")
#install.packages("GOplot")

library(GOplot)
setwd("C:\\others\\yangfan\\caogao2\\17.GOplot")              #���ù���Ŀ¼

ego=read.table("GO.txt", header = T,sep="\t",check.names=F)      #��ȡkegg��������ļ�
go=data.frame(Category = "All",ID = ego$ID,Term = ego$Description, Genes = gsub("/", ", ", ego$geneID), adj_pval = ego$p.adjust)

#��ȡ�����logFC�ļ�
id.fc <- read.table("id.txt", header = T,sep="\t",check.names=F)
genelist <- data.frame(ID = id.fc$gene, logFC = id.fc$logFC)
row.names(genelist)=genelist[,1]

circ <- circle_dat(go, genelist)
termNum = 5                                     #�޶�term��Ŀ
geneNum = nrow(genelist)                        #�޶�������Ŀ

chord <- chord_dat(circ, genelist[1:geneNum,], go$Term[1:termNum])
pdf(file="circ.pdf",width = 13,height = 11)
GOChord(chord, 
        space = 0.001,           #����֮��ļ��
        gene.order = 'logFC',    #����logFCֵ�Ի�������
        gene.space = 0.25,       #��������ԲȦ����Ծ���
        gene.size = 4,           #�����������С 
        border.size = 0.1,       #������ϸ
        process.label = 7.5)     #term�����С
dev.off()

termCol <- c("#223D6C","#D20A13","#FFD121","#088247","#58CDD9","#7A142C","#5D90BA","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767")
pdf(file="cluster.pdf",width = 14,height = 10)
GOCluster(circ.gsym, 
          go$Term[1:termNum], 
          lfc.space = 0.2,                   #����������Ŀ�϶��С
          lfc.width = 1,                     #�仯������ԲȦ����
          term.col = termCol[1:termNum],     #�Զ���term����ɫ
          term.space = 0.2,                  #������term��Ŀ�϶��С
          term.width = 1)                    #����term��ԲȦ����
dev.off()          

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######������ѧ��: http://www.biowolf.cn/
######�������䣺2749657388@qq.com
######����΢��: 18520221056