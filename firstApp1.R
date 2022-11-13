install.packages(c("shiny", "shinythemes"))
library(shiny)
library(shinythemes)


ui<- fluidPage(theme = shinytheme("cerulean"),
     navbarPage(
       "My First App",
       tabPanel("Choose your Chart",
            sidebarPanel(
              tags$h3("Input:"),
              textInput("txt1","Given Name:", ""),
              textInput("txt2", "Last Name:", "")
            ),
            mainPanel(
              h1("Here's the output"),
              h4("My data is here"),
              verbatimTextOutput("txtout")
            )
                )
     )          
               
)


server<- function(input, output){
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep=" ")
  })
}

shinyApp(ui=ui, server=server)
