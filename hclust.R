#!/usr/bin/Rscript
#system(paste("/Users/sky/Desktop/'Cytokines MGX'/CRC/scripts/hclust.R", "/Users/sky/Desktop/'Cytokines MGX'/CRC/tree"))
#脚本外传参
args<-commandArgs(T)
dir<-args[1]
#ck_list<-list("CCL1", "CCL11", "CCL13", "CCL14", "CCL15", "CCL16", "CCL17", "CCL18", "CCL19", "CCL2", "CCL20", "CCL21", "CCL22", "CCL23", "CCL24", "CCL25", "CCL26", "CCL27", "CCL3", "CCL3L1", "CCL4", "CCL4L2", "CCL5", "CCL6", "CCL7", "CCL8", "CCL9", "CD40LG", "CKLF", "CLCF1", "CSF-1", "CX3CL1", "CXCL1", "CXCL10", "CXCL11", "CXCL12", "CXCL13", "CXCL14", "CXCL16", "CXCL17", "CXCL2", "CXCL3", "CXCL5", "CXCL6", "CXCL9", "EBI3", "EGF", "EPO_TPO", "FGF", "Flt3_lig", "GCSF", "GDF15", "GM_CSF", "HGF", "IFNL1", "IFNL3", "IFN-γ", "IL1", "IL10", "IL11", "IL12", "IL13", "IL14", "IL15", "IL16", "IL17", "IL19", "IL1RN", "IL2", "IL20", "IL21", "IL22", "IL23", "IL26", "IL27", "IL28A", "IL3", "IL31", "IL32", "IL33", "IL34", "IL36RN", "IL4", "IL5", "IL6", "IL6ST", "IL7", "IL8", "IL9", "Interferon", "LECT1", "LECT2", "LIF_OSM", "MIF", "Osteopontin", "PDGF", "PF4", "PF4V1", "PPBP", "Resistin", "SCF", "TGF_β", "TGFA", "TNF", "TNFSF13B", "XCL1", "XCL2")
ck_list<-list("IL12")

#遍历列表
for (ck in ck_list){
    dir_file<-paste(dir, "/", ck, "_kr64.txt", sep="")
    dir_file_detail<-paste(dir, "/", ck, "_kr64_details.txt", sep = "")
    # print(dir_file)
    # print(dir_file_detail)

    #先找出有多少条序列(n)
    n<-read.table(dir_file, head=F, nrow=1)
    as.data.frame(lapply(n,as.numeric))
    n = n[1,1]
    # print(n)

    #再读取每条序列的名称并处理为合适格式
    m<-read.table(dir_file_detail, fill=TRUE, head=F, nrow=n+1, sep="\t", stringsAsFactors = FALSE)
    l1<-m[,1] #取第一列
    l1<-l1[2:length(l1)] #去首行subject
    #print(m)
    #print(l1)
    a<-tstrsplit(l1, split="\\[") #将l1分成名字和杂乱信息
    b<-a[[1]] #只留名字
    ck_index<-strsplit(b, split = " ")

    #读取序列距离矩阵
    ck_table<-read.table(dir_file, fill=TRUE, head=F)
    ck_table<-ck_table[2:length(ck_table),] #取矩阵(无列标题)
    print(ck_table[1,3])


#
#     #画树
#     table<-read.table("/Volumes/My Book Duo/test/MIF_krtest.txt",head=F)
#     a<-table[-c(1)]
#     MIF_matrix = data.matrix(a)
#     #无标签
#     #MIF_dist<-as.dist(MIF_matrix)
#     #MIF_cluster <- hclust(MIF_dist,"average")
#     #plot(MIF_cluster, main="", hang=-1,ylab="Similarity",axes=FALSE)
#     #带标签&分组(四分位数)
#     dimnames(MIF_matrix)<-list(1:n,l)
#     MIF_dist<-as.dist(MIF_matrix)
#     MIF_cluster <- hclust(MIF_dist,"average")
#     plot(MIF_cluster, main="", hang=-1,ylab="Similarity",axes=FALSE)
#     scale_max<-max(MIF_cluster$height)
#     quarter<-scale_max/4
#     scale=seq(0, scale_max, by=quarter)
#     sequence<-seq(0,(scale_max), by=quarter) #get sequence of heights from dendrogram
#     percent<-as.integer((sequence/max(MIF_cluster$height)*100)) #Convert these to a percent of the maximum height
#     lines(x = c(0,0), y = c(0,max(MIF_cluster$height)),type = "n")
#     axis(2,at=scale, labels=percent)
#
#     rect.hclust(MIF_cluster, k=2)
#     rect.hclust(MIF_cluster, k=3)
#     rect.hclust(MIF_cluster, k=4)
}
