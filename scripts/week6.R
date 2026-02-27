# DV Lab – Week 06A
# Name:K.Sarveswara Rao
# Roll No:23A91A6187
#Load and Understand the DataSet
data(diamonds)
data(package=.packages(all.available = TRUE))
library(ggplot2)
data("diamonds")
str(diamonds)
dim(diamonds)
?diamonds

#Very basic Scatter'

plot(diamonds$carat,diamonds$price)

#improved Scatter
plot(diamonds$carat,diamonds$price,col=rgb(0,0,1,0.1),pch=16,
     main = "Scatter Plot: Carat Vs Price")
#Hexbin Using base r
install.packages('hexbin')

library(hexbin)
hb<-hexbin(diamonds$carat,diamonds$price,xbins = 40)
plot(hb,main="Hexbin Plot")

#basic hexbin using ggplot2

ggplot(diamonds,aes(x=carat,y=price))+
  geom_hex()
#labeled hexbin plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs(title='Hexagon Binning:Diamond Structure',x='carat',y='price')+
  theme_minimal()

# Control Hexagon Density
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="gold",high="red")+
  theme_minimal()

# Color Meaning
# Light-> Fewer Diamonds
# Dark -> dense Region

#Professional Palette (Virdis)
ggplot(diamonds,aes(carat,price))+geom_hex(bins=35)+scale_fill_viridis_c()+
  theme_minimal()
#add legend title

ggplot(diamonds,aes(carat,price))+geom_hex(bins=20)+
  scale_fill_viridis_c(name="Count")+
  labs(title = "Density Structure of Diamonds",x="Carat",y="Price")+
  theme_minimal()

#Faceted Hexbin
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  scale_fill_viridis_c()+
  facet_wrap(~cut)+
  theme_minimal()
