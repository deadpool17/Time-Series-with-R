data("AirPassengers")
class(AirPassengers)
start(AirPassengers)
end(AirPassengers)
str(AirPassengers)
summary(AirPassengers)
plot(AirPassengers)


#this will plot the time series
reg=lm(AirPassengers~time(AirPassengers))
summary(reg)
abline(reg)

#prints cycle across the years
cycle(AirPassengers)

#plotting of mean aggregates
 plot(aggregate(AirPassengers,FUN = mean))

 #plotting sessional effect i.e across the cycle with air passengers 
 boxplot(AirPassengers~cycle(AirPassengers))
 
library(tseries) 
 adf.test(diff(log(AirPassengers)),alternative = "stationary",k=0)

acf(log(AirPassengers)) 

pacf(log(AirPassengers)) 

acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))

fit<-arima(log(AirPassengers),order=c(0,1,1),seasonal = list(order=c(0,1,1),period=12))
 pred<-predict(fit,n.ahead = 10*12)
summary(pred)
#lty=c(1,3) used for dashed line 
#e=2.718
ts.plot(AirPassengers,2.718^pred$pred,log="y",lty=c(1,3))
