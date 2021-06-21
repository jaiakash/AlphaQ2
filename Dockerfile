FROM ubuntu

COPY . /scripts
WORKDIR /scripts/

# Update and Dependancies
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
RUN apt-get install adduser
RUN apt-get install sudo

# All scipts as executable
#RUN chmod +x ./script.sh
#RUN chmod +x ./attendance.sh
#RUN chmod +x ./genMoM.sh

# Runing the scripts
#RUN bash ./genUser.sh
RUN bash ./permit.sh
RUN bash ./schedule.sh
RUN bash ./attendance.sh 2019-12-12 2020-03-16
RUN bash ./genMoM.sh 2020-07-16
