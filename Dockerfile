FROM rocker/rstudio

#Add shiny
RUN export ADD=shiny && bash /etc/cont-init.d/add


#Update ubuntu and install depencencies
RUN apt-get update
RUN apt-get install -y libxml2-dev

#Install basic packages
RUN R -e 'install.packages(c("shinydashboard"), repos="http://cran.us.r-project.org")'

#Install basic packages
RUN R -e 'install.packages(c("data.table","dplyr","dtplyr"), repos="http://cran.us.r-project.org")'

#Install statistical packages
RUN R -e 'install.packages(c("e1071","randomForest","glm"), repos="http://cran.us.r-project.org")'

#Install ggplot packages
RUN R -e 'install.packages(c("ggplot2","ggvis"), repos="http://cran.us.r-project.org")'

#Install Caret Machine learning environments
RUN R -e 'install.packages(c("caret","caretEnsemble"), repos="http://cran.us.r-project.org")'

#Install Caret Machine learning environments
RUN R -e 'install.packages(c("mlr"), repos="http://cran.us.r-project.org")'

#Install Spark
RUN R -e 'install.packages(c("sparklyr"), repos="http://cran.us.r-project.org")'

#Install Connectors:
RUN R -e 'install.packages(c("rkafka"))'

#Install Cloud Connectors:
RUN R -e 'install.packages(c("aws.s3"))'
