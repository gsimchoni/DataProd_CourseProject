library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Guess the top 10 R packages of 2015!"),
  h4("The following are the top 10 downloaded packages of 2015 (January - May)."),
  h4("Can you arrange them in the correct order?!"),

  tabsetPanel(
    # Starting App Tab
    tabPanel("App",
             fluidRow(
               # Two columns, 5 packages in each
               column(width = 6, align = "center",
                      lapply(packages_shuffled[1:5], function(n) {
                        uiOutput(n)
                        })
                      ),
               column(width = 6, align = "center",
                      lapply(packages_shuffled[6:10], function(n) {
                        uiOutput(n)
                        })
                      )
               ),
             fluidRow(
               # One column, centered, for the action button
               column(width = 12, align = "center",
                      actionButton(inputId = "seeResults", label = "See my results", icon = NULL)
                      )
               ),
             fluidRow(align = "center",
                      uiOutput("results")
                      )
             ),
    # Ending App tab
    # Starting Documentation tab
    tabPanel("Documentation",
             fluidRow(
               h4("This is a very simple little app:"),
               br(),
               h4("1. You get the list of 10 most downloaded R packages in Jan-May 2015, according to ",
               a("KDNuggets", href = "http://www.kdnuggets.com/2015/06/top-20-r-packages.html", target="_blank"),
               "(but don't peak!)"),
               h4("2. Your job is to order them from rank 1 (most downloaded) to rank 10 (least downloaded)"),
               h4("3. Whenever you think you're done, press the \"See my Results\" button"),
               h4("4. The app will tell you how many ranks you got right"),
               h4("5. When you succeed, it will also tell you how long (in seconds) it took you"),
               br(),
               h4("Sounds easy, doesn't it? Have fun!")
               )
             )
    )
  )
  )