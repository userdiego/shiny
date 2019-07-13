library(shiny)
library(shinyWidgets)
shinyUI(fluidPage(
        titlePanel("Visualizing power calculations"),
        sidebarLayout(
                sidebarPanel(
                        setSliderColor(c("red", "", "Teal", "Teal"), sliderId = c(1, 3, 4)),
                        sliderInput("sliderM1", "Mean A", 0, 100, value = c(60)),
                        sliderInput("sliderM2", "Mean B", 0, 100, value = c(70)),
                        sliderInput("slider2", "Sample Size", 5, 100, value = 80),
                        numericInput("numeric", "Alpha error", value = 0.05, min = 0, max = 1, step = 0.01),
                        sliderInput("slider3", "Standard Deviation", 1, 50, value = 20)
                ),
                mainPanel(
                        h3("Kernel density plot for random t distributions"),
                        plotOutput("plot"),
                        h5("Power calculation for a two-sample, two-sided t-test:"), 
                        textOutput("power")
                )
        )
))