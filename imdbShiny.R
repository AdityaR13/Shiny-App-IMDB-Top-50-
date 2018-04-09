#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
setwd("C:/Users/ADitya/Documents/R")
imdb <- read.csv("IMDB Top 50.csv")

library(shiny)

# Define UI for application
ui <- fluidPage(
   
   # Application title
   titlePanel("IMDB movies"),
   
   # Sidebar with a slider input for number
   sidebarLayout(
      sidebarPanel(
        #implementing radio buttons                      # not needed in this 
        # radioButtons("p", "Select one in this dataset:",
         #            list("Rank"='a', "Rating"='b')),
        
        
         sliderInput(inputId =  "Rank",               #  inputid is used further, values is default value
                     "choose a Rank:",
                     min = 1,
                     max = 50,
                     value = 20)),
      
      
      # Main panel
      mainPanel(
        verbatimTextOutput(outputId = "text"))))       # verbatim used instead of textOutput because of line breaking in output


# Define server logic

server <- function(input, output) {
  imdbSub <- reactive({                         # Reactive interace is needed because every input of rank filters data for that row
    a <- subset(imdb, Rank == input$Rank)       # input rank as used earlier ( necessary )
    return(a)
  })
  
    output$text <- renderText({                                                          # Render Text
      print(paste(" You have selected Rank:", "     ", input$Rank, "\n","\n",            # "\n" is used for line breaking.  Used twice for double line breaking
          "Movie Title is:","          " ,Title <- imdbSub()$Title, "\n","\n",           # imdbSub() , here using  ()  is necessary
          "Movie Rating is:","         " ,Rating <- imdbSub()$Rating, "\n","\n",         # input spacing so output look good alligned
          "Movie Year is:","           " ,Year <- imdbSub()$Year, "\n","\n",
          "Movie Genre is:","          " ,Genre <- imdbSub()$Genre, "\n","\n",
          "Movie Actor is:", "          ",Actor <- imdbSub()$Actor, "\n","\n",
          "Movie Director is:", "       ", Director <- imdbSub()$Director, "\n","\n",
          "Movie Votes are:","         " ,Votes <- imdbSub()$Votes, "\n","\n",
          "Movie Earning(Mil) is:","   " ,Gross <- imdbSub()$Gross_Earning_in_Mil, "\n","\n",
          "Movie Runtime(min) is:","   " ,Runtime <- imdbSub()$Runtime, "\n","\n",
          "Movie Metascore is:","      " ,Meta <- imdbSub()$Metascore, "\n","\n",
          "Movie Plot is:","           " ,Plot <- imdbSub()$Description
          
          
          
         
         
         
         
         ))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

