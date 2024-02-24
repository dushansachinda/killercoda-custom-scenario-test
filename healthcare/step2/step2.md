Open MI deloyment toml file and update service catelog.
 `vi mi/wso2mi-4.2.0/conf/deployment.toml`{{execute}}
 
    ```
    [[service_catalog]]
    apim_host = "https://localhost:9443"
    enable = true
    username = "admin"
    password = "admin"
    ```{{}}

- Set backend enviorment variable
   `export GRAND_OAK_ENDPOINT=http://localhost:9090/grandOaks/doctors/`{{execute}}


   `export PINE_VALLEY_ENDPOINT=http://localhost:8080/pineValley/doctors`{{execute}}


- Start APIM 

  `sh apim/wso2am-4.2.0/bin/api-manager.sh start`{{execute}}

- Check the APIM logs

  `tail -f apim/wso2am-4.2.0/repository/logs/wso2carbon.log`{{execute}}
Prese Ctrl+C to exit from the logs

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

TODO