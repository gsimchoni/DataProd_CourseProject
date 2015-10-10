library(shiny)

shinyServer(function(input, output) {
  
  # Creating the numericInput for each of the packages, shuffled
  lapply(1:10, function(i) {
    output[[packages_shuffled[i]]] <- renderUI({
      numericInput(packages_shuffled[i], packages_shuffled[i], value = i, min = 1, max = 10, step = 1)
    })
  })
  
  # Rendering the results statement based on input
  output$results <- renderUI({
    
    # The correct_sum in 'isolate' will only be calculated when 'seeResults' actionButton is pressed
    isolate(
      correct_sum <-
        # At the beginning of the app the packages input is empty! the sum_correct is then the number of times the shuffled
        # packages list was equal to the original packages list
        if (length(input[[packages[1]]]) > 0) {
          sum(
            sapply(1:10, function(i) {
              input[[packages[i]]] == i
            }))} else {
              sum(packages == packages_shuffled)
            }
    )
    
    # If the actionButton has not been pressed yet - don't print results
    if (input$seeResults == 0) {
      return()
    } else {
      # Different results print according to whether user succeeded (correct_sum == 10) or not
      if (correct_sum == 10) {
        if (input$seeResults == 1) {
          return(h4(paste("Success! You guessed all 10! And it only took you", input$seeResults, "try in", 
                          floor(as.numeric(difftime(Sys.time(), start.time, units = "secs"))), "seconds!")))
        } else {
          return(h4(paste("Success! You guessed all 10! And it only took you", input$seeResults, "tries in", 
                          floor(as.numeric(difftime(Sys.time(), start.time, units = "secs"))), "seconds!")))
        }
      } else {
        return(h4(paste("You guessed", correct_sum, "out of 10. Try Again.")))
      }
    }
    
  })
})
