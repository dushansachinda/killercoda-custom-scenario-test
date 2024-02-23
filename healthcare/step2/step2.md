Open MI deloyment toml file and update service catelog.
 `vi mi/wso2mi-4.2.0/repository/conf/deployment.toml`{{execute}}
 
    ```
    [[service_catalog]]
    apim_host = "https://localhost:9443"
    enable = true
    username = "admin"
    password = "admin"
    ```{{}}

- Start the first MI instance

  `sh mi/wso2mi-4.2.0/bin/micro-integrator.sh start`{{execute}}

- Set backend enviorment variable
   `export GRAND_OAK_ENDPOINT=http://localhost:9090/grandOaks/doctors/`{{execute}}
   `export PINE_VALLEY_ENDPOINT=http://localhost:8080/pineValley/doctors`{{execute}}

- Check the logs

  `sh mi/wso2mi-4.2.0/bin/micro-integrator.sh start`{{execute}}

- Start the first APIM instance

  `tail -f apim/wso2mi-4.2.0/repository/logs/wso2carbon.log`{{execute}}

- Check the logs

  `tail -f apim/wso2am-4.2.0/repository/logs/wso2carbon.log`{{execute}}

  Prese Ctrl+C to exit from the logs

- Access the UIs. you could deploy the sample API

  {{TRAFFIC_HOST1_80}}/publisher

  {{TRAFFIC_HOST1_80}}/devportal

- Stop the first APIM instance

  `sh apim/wso2am-4.2.0/bin/api-manager.sh stop`{{execute}}

  Make sure the first instance is stoped by checking the logs again