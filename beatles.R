#Simple plot showing THe Beatles dominance of the 1964 Billboard Hot 100
#number one position.


library(ggplot2)
library(RColorBrewer)

##Source: Wikipedia List of Billboard Hot 100 Number Ones
##https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_1964

beatles <- data.frame(column = c("The Beatles", rep("Literally everyone else", 
                                                     14)),
                      
                      band = c("The Beatles", "The Supremes", "The Dixie Cups",
                                "The Animals", "Roy Orbison", "Mary Wells",
                                "The Beach Boys", "The Four Seasons", 
                                "Manfred Mann", "Louis Armstrong",
                                "Peter and Gordon", "Dean Martin", 
                                "The Shangri-Las", "Lorne Greene", 
                                "Bobby Vinton"),
                      
                      weeks = c(20, 7, rep(3, 3), rep(2, 4), rep(1,6))
                      )

##reorder factor labels
beatles$band  <- with(beatles, reorder(band, weeks))

#color palette for plot
mycols <- c(colorRampPalette(brewer.pal(9, "YlOrRd"))(14), "orangered")

#the plot, written to a file. Made it an appropriate size for twitter banner.

png("beatles.png", height = 300, width = 900)

ggplot(beatles, aes(x = column, y = weeks, fill = band)) +
      geom_col(color = "black") +
      scale_fill_manual(values = mycols) +
      theme(plot.title = element_text(color = "red"),
            axis.title.y = element_blank(),
            axis.text.y = element_text(face = "bold")) +
      coord_flip() +
      labs(title = "Billboard Hot 100, 2/1/1964 - 1/9/1965",
           subtitle = "Weeks at Number One",
           ylab = NULL)

dev.off()

