library(rmarkdown)
bookdown::render_book("handouts/index.Rmd", "bookdown::gitbook", output_dir="docs")
# slides=list.files("pres","*.Rmd",full.names=TRUE)
#
# for (f in slides) render(f,output_dir = "docs")
