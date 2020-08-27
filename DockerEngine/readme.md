# Checkmarx CxSAST Engine server Docker-based for Linux

This is a CxSAST Engine Server suitable for Linux OS

## Getting Started

These instructions will get you CxSAST Engine Server container up and running on your Linux machine. 
See deployment notes on how to deploy the server on a live system.

## Package content ./cx-sast-linux-server
	* cx-engine-server.tar
	* server.env
	* readme.md
	* run.sh

### Prerequisites

Docker Engine

### Prerequisites installation links

Docker engine: https://docs.docker.com/engine/install/ 

## Deployment

1. Update environment variables - server.env file (located at /cx-sast-linux-server):
	* ES_MESSAGE_QUEUE_PASSWORD={retrieve from DB see Appendix}                          
	* ES_MESSAGE_QUEUE_URL=tcp://{client host address}:61616                         
	* CX_ES_ACCESS_CONTROL_URL=http://{client host address}/CxRestAPI/auth
	* CX_ES_END_POINT={cx-server host address - example - http://x.x.x.x:8088}
2. Copy cx-sast-linux-server directory to your linux server machine.
3. Run script run.sh - run command "sh run.sh"

### run.sh script actions

When running run.sh script, following operations will be performed:

1. Load Checkmarx server image from the local tar file.
2. Run Checkmarx server container, exposed port 8088.
* To change the exposed port view "How to change CxSAST engine server container exposed port" section.

### Changing CxSAST engine server container exposed port

In order to change the exposed port of the CxSAST engine server container,
Edit run.sh script as follows:
1. modify exposed port - "docker run" command 0.0.0.0:{exposed port}:8088
2. save and run 

### Hello CxSAST Engine Server - verify server up and running.

1. Run command "docker ps" --> container is up and running. 
```
	* IMAGE: cx-engine-server
	* PORTS: 0.0.0.0:8088->8088/tcp
```
2. Run command "docker logs -f {container ID}" --> server running - console output.
```
	* Now listening on: http://[::]:8088 |Application started.
```

## Connecting to CxSAST Portal (application)

Register the engine server:
SAST web portal -> Settings -> Application Settings -> Engine Management


## Appendix 

### Retrieve message queue password value

Message queue is usually deployed as part of the CxMAnager component. 
In order to retrieve its password, connect to CxSAST database, and execute the following SQL query:
```
  SELECT TOP (1000) [Id]
      ,[Key]
      ,[Value]
      ,[Description]
  FROM [CxDB].[dbo].[CxComponentConfiguration]
  where [Key] = 'MessageQueuePassword'
```

## Documentation

https://supportportal.checkmarx.net/

## Versioning

CxSAST engine server 9.3.0 and up

## License

View @Checkmarx license for details
