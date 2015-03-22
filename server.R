library(shiny)
data(mtcars)

predict_mgp<-function(cylr){
  model_fit<-lm(mtcars$mpg~mtcars$cyl,data=mtcars)
  prediction<-coef(model_fit)[1]+coef(model_fit)[2]*cylr
  #mean_predict<-predict(model_fit,newdata=cylr)
}

shinyServer(
    function(input,output){
      # mpg as a function of number of cyllinders
      output$regModel<-renderPlot({
        mpg_variation<-lm(mtcars$mpg~cyl,data=mtcars)
        plot(mtcars$cyl,mtcars$mpg,xlab="Number of cyllinders",ylab="MPG",col="black",cex=1.1,pch=21,frame=FALSE)
        abline(mpg_variation,lwd=2)
        })
      # mpg as a function of transmission 
      output$boxPlot<-renderPlot({
        mpgTr<-lm(mtcars$mpg~am,data=mtcars)
        par(mfrow=c(1,2),mar=c(4,4,2,1))
        plot(mtcars$am,mtcars$mpg,xlab="Transmission",ylab="MPG",col="black",cex=1.1,pch=21,frame=FALSE)
        abline(mpgTr,lwd=2)
        boxplot(mtcars$mpg~mtcars$am,data=mtcars,xlab="Transmission",ylab="MPG",col="black",cex=1.1,pch=21,frame=FALSE)
        
      })
      output$inputValue<-renderPrint(input$cylr)
      output$prediction<-renderPrint({predict_mgp(input$cylr)})
     }
)