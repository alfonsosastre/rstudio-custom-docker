FROM rocker/rstudio

#Add shiny
RUN export ADD=shiny && bash /etc/cont-init.d/add


#Update ubuntu and install depencencies
RUN apt-get update

#Install shinydashboard packages
RUN R -e 'install.packages(c("shinydashboard"), repos="http://cran.us.r-project.org")'

#Install basic packages to use datasets
RUN R -e 'install.packages(c("data.table","dplyr","dtplyr"), repos="http://cran.us.r-project.org")'

#Install statistical packages
RUN R -e 'install.packages(c("e1071","randomForest","glm"), repos="http://cran.us.r-project.org")'

#Install tensorflow package
RUN apt-get -y install python-pip virtualenv
RUN R -e 'install.packages(c("tensorflow"), repos="http://cran.us.r-project.org")'
RUN R -e 'tensorflow::install_tensorflow()'

#Install keras package
RUN R -e 'install.packages(c("keras"), repos="http://cran.us.r-project.org")'
RUN R -e 'keras::install_keras()'

#Install visualization packages
RUN R -e 'install.packages(c("ggplot2","ggvis"), repos="http://cran.us.r-project.org")'

#Install Caret Machine learning environments
RUN R -e 'install.packages(c("caret","caretEnsemble","doMC"), repos="http://cran.us.r-project.org")'

#Install Caret Machine learning environments
RUN R -e 'install.packages(c("mlr"), repos="http://cran.us.r-project.org")'

#Install Spark support
RUN apt-get -y install openjdk-8-jdk
RUN R -e 'install.packages(c("sparklyr"), repos="http://cran.us.r-project.org")'

#Install kafka connector:
RUN R -e 'install.packages(c("rkafka"))'

#Install s3 connector:
RUN apt-get install -y libxml2-dev
RUN R -e 'install.packages(c("aws.s3"))'
