## BA Analysis
library(blandr)
blandr.output.text ( data$Measure1 , data()$Measure2 , sig.level=0.95 )


##Custumize the graph: colorcode by groups

library(ggplot2)

ba <- blandr.statistics(data$Measure1,data$Measure2)

group= data$yourgroup
means  = ba$means
differences  = ba$differences
badata=data.frame(group,means,differences)

ggplot(badata, aes(x=means, y=differences, color=zone)) + geom_point(size=3,shape=3)+
  theme_classic2()+
  geom_hline(yintercept=0,) +
  geom_hline(yintercept=0.89329,linetype="dashed")+  #change the number for upper level
  geom_hline(yintercept=-1.278846,linetype="dashed")+ #change the number for bias
  geom_hline(yintercept=-0.192,linetype="dashed")+ #change the number for lower level
  ylim(-2, 2)+
  labs(title="Bland-Altman Plot for Comparison of two measurements",x="Means", y = "Differences")
