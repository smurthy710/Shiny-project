library("shiny")

shinyServer(function(input, output) {

     
     output$distPlot <- renderPlot({  
          df<- c(1:20)
          
          PerDef1<- input$PerDef 
          Popu<-input$Poplu #1000
          Sample1<-input$Samp
          ci<-input$ciI
          
          propdef<- dhyper(df, input$PerDef*Popu/100, Popu-input$PerDef*Popu/100, Sample1, log = FALSE)
   
          deftab<-as.data.frame(cbind(df,propdef))
          allowdef<-min(deftab[deftab$propdef > (100-ci)/200,]$df)
               
          plot(df,propdef,xlab = "Num of Defects in Sample",ylab = "Prop")
          lines(df,propdef)
          abline(h=(100-ci)/200,col="red")
          

          abline(v=allowdef,col="green")
          
         
     })
     output$MaxDef<-renderText({ 
          PerDef1<- as.numeric(input$PerDef) 
          Popu<-as.numeric(input$Poplu) #1000
          Sample1<-as.numeric(input$Samp)
          ci<-as.numeric(input$ciI)
          df<- c(1:20)
          
         propdef<- dhyper(df, input$PerDef*Popu/100, Popu-input$PerDef*Popu/100, Sample1, log = FALSE)
           
          deftab<-as.data.frame(cbind(df,propdef))
          allowdef<-min(deftab[deftab$propdef > (100-ci)/200,]$df)
  
         as.numeric(allowdef)
          
          
     })
})