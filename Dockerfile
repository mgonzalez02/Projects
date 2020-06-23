#grab docker image with openjdk
FROM arm32v7/openjdk:8
#workdir
WORKDIR /usr/src/Cxflow
#Copy cxflow to the container
COPY /Cxflow .
#Run cxflow
CMD java -jar cx-flow-1.5.4.jar --spring.config.location=app.yml --web
#command to run cxflow
#java -jar cx-flow-1.5.4.jar --spring.config.location=app.yml --web