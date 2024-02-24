#### APIM -

Open MI deloyment toml file and update service catelog.
  - Open the APIM configuration file

    `vi apim/wso2am-4.2.0/repository/conf/deployment.toml`{{execute}}

  - Check the hostname under the server section. This is preconfigured to match with this playground. In the other environments, you should update the hostname accordingly

    ```
    [server]
    hostname="portal.ourcompany.com"
    ```{{}}

  - Add the proxy port configuration

    ```
    [transport.https.properties]
    proxyPort=443
    ```{{copy}}

 
 #### MI
 - Add Service Catelog connection

 `vi mi/wso2mi-4.2.0/conf/deployment.toml`{{execute}}
 
    ```
    [[service_catalog]]
    apim_host = "https://localhost:9443"
    enable = true
    username = "admin"
    password = "admin"
    ```{{}}

> **_NOTE:_** Above configration will enable MI APIs or services to be discoverd at APIM.


- Set backend enviorment variable
   `export GRAND_OAK_ENDPOINT=http://localhost:9090/grandOaks/doctors`{{execute}}


   `export PINE_VALLEY_ENDPOINT=http://localhost:8083/pineValley/doctors`{{execute}}


#### APIM Startup 
- Start APIM 

  `sh apim/wso2am-4.2.0/bin/api-manager.sh start`{{execute}}

- Check the APIM logs

  `tail -f apim/wso2am-4.2.0/repository/logs/wso2carbon.log`{{execute}}
Prese Ctrl+C to exit from the logs

> **_NOTE:_** Please wait until the API Manager has started completely before starting the MI server.

#### MI Startup 

- Start MI 

  `sh mi/wso2mi-4.2.0/bin/micro-integrator.sh start`{{execute}}

- Check the MI logs

  `tail -f mi/wso2mi-4.2.0/repository/logs/wso2carbon.log`{{execute}}

Prese Ctrl+C to exit from the logs

- Access the UIs. you could deploy the sample API

  {{TRAFFIC_HOST1_80}}/publisher

  {{TRAFFIC_HOST1_80}}/devportal

- Stop  APIM  / MI instance

  `sh apim/wso2am-4.2.0/bin/api-manager.sh stop`{{execute}}

  `sh mi/wso2mi-4.2.0/bin/micro-integrator.sh stop`{{execute}}


> **_NOTE:_** Following only tests API internally. Follow API publisher lifeccyle and the document related API subscription for more information.

#### APIM Discover HealthCareAPI
- Discover API
- Publish API
- Internal testing API
   `curl -k -X 'GET' \
  '{{TRAFFIC_HOST1_8080}}/healthcare/1.0.0/doctor/Ophthalmologist' \
  -H 'accept: application/json'\
  -H 'Internal-Key: <<replace API-token>>' `{{copy}}