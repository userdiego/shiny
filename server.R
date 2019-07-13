library(shiny)
shinyServer(function(input, output) {
        output$plot <- renderPlot({
                set.seed(100)
                mean1 <- input$sliderM1
                mean2 <- input$sliderM2
                n <- input$slider2
                t1 <- rt(n/2, (n/2) -1, mean1)
                t2 <- rt(n/2, (n/2) -1, mean2)
                plot(density(t2), col = "blue", main = "", xlab = "", ylab = "")
                lines(density(t1), col = "red")
        })
        output$power <- renderText({
                delta <- input$sliderM1 - input$sliderM2
                a <- input$numeric
                n <- input$slider2
                sd <- input$slider3
                p <- power.t.test(n, delta, sd, sig.level = a, type = "two.sample")
                p$power
        })
})