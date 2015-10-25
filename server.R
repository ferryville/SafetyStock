
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(httr)


shinyServer(function(input, output) {


  mydata <-data.frame("Month"=c("jul-14","aug-14","sep-14","oct-14","nov-14","dec-14"),"SALES"=c(5.91,5.01,5.03,5.29,5.97,5.89))
  
  output$mytable =renderDataTable({
    mydata
  })
  output$plot1 <- renderPlot({
  
   plot(mydata$SALES, xlab="Month",ylab="Sales",ylim=c(0,10),type="l", main='Total Sales')
   ss <- max(sd(mydata$SALES)*qnorm(input$slider)*sqrt(input$ldt),0)
   abline(h=ss,col="red")
   output$dynamic_value <- renderPrint({
     ss
   })
   
  })
  
  
})
