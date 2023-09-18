# Zeebe Workflow Engine Test Suite

This test suite targets the [Zeebe Workflow Engine](https://github.com/camunda/zeebe).

## System Details

**APIs**:

- **Command API** is exposed at:
  - Port: `26500`

- **Internal API** is exposed at:
  - Port: `26502`

- **Monitoring API** is exposed at:
  - Port: `9600`

**Containerization**:

Zeebe is deployed locally using Docker, providing a consistent and recommended development environment. 

**Network Ports**:

- `26501`
- `26502`
- `9600`

> Note: The broker requires communication from the gateway and other brokers and exposes a port for monitoring. For improved resilience during the Zeebe gateway's startup process, all broker connections can be utilized.

**Docker Command**:
docker run --name zeebe -p 26500-26502:26500-26502 -p 9600:9600 camunda/zeebe:latest

This command exposes all necessary ports for broker access and monitoring.

## Health Checks

Zeebe broker exposes three HTTP endpoints for health checks:

- **Startup Check**: `http://{zeebe-broker-host}:9600/startup`
  - Returns an empty 204 response when ready. Otherwise, a 503 error.

- **Ready Check**: `http://{zeebe-broker-host}:9600/ready`
  - Returns an empty 204 response when ready. Otherwise, a 503 error.

- **Health Check**: `http://{zeebe-broker-host}:9600/health`
  - Returns an empty 204 response when healthy. Otherwise, a 503 error.

## Technology Stack

| Functionality      | Technology/Tool       |
|--------------------|-----------------------|
| Containerization   | Docker                |
| Version Control    | Git                   |
| Language           | Python                |
| IDE                | Pycharm (VS Code, etc.)|
| Libraries          | Request Library       |
| Test Automation    | Robot Framework       |

## Running the Tests

on your IDE
1. Open the test Folder on your IDE.
2. Choose the folder "health_status.robot
3. Open your terminal from the IDE if Enabled
2. select the file: health_status-robot
3. Execute the following command:
  
robot health_status.robot

Using the command prompt or Git Bash
1. Navigate to the `tests` directory 
2. Execute the following command:

robot health_status.robot




