# Ciclo luminoso de tubo fluorescente con R 
# www.datosimagensonido.com

# Revelado lineal con DCRAW: dcraw -v -w -o 2 -4 -T neon.orf
# Recorte del tubo (promediado de 60 píxeles de ancho) y conversión de TIFF a PNG en Photoshop

# Leemos imagen
library(png)
neon=readPNG("neon60px.png")
neon=neon/max(neon)

# Dibujamos gráficas
xaxis=seq(0, 3472*60/3277, len=3472)

plot(xaxis, neon[,,3], type='l', col="blue", main="Ciclo luminoso de tubo fluorescente", xlab="Tiempo (ms)", ylab="RGB")
lines(xaxis, neon[,,2], col="green")
lines(xaxis, neon[,,1], col="red")

lum=0.299*neon[,,1]+0.587*neon[,,2]+0.114*neon[,,3]
plot(xaxis, lum, type='l', main="Ciclo luminoso de tubo fluorescente", xlab="Tiempo (ms)", ylab="Luminosidad", ylim=c(0,1))
