Download the WSO2 API Manager

> **_NOTE:_** [Optional] You could download the WSO2 product binary files from the WSO2 website as well.

#### API Manager 4.2.0

- Use the following command to download the WSO2 API Manager binary file.

  `wget -O wso2am-4.2.0.zip https://github.com/dushansachinda/killercoda-custom-scenario-test/resources/raw/main/binaries/apim/wso2am-4.2.0.zip?download=true`{{execute}}

- Create a directory for the API Manager installation

  `mkdir apim`{{execute}}

- Extract the WSO2 APIM binary to the new folder

  `unzip wso2am-4.2.0.zip -d apim/`{{execute}}


#### Micro Integrator 4.2.0

- Use the following command to download the WSO2 Micro Integrator binary file.

  `wget -O wso2mi-4.2.0 https://github.com/dushansachinda/killercoda-custom-scenario-test/resources/raw/main/binaries/mi/wso2mi-4.2.0.zip?download=true`{{execute}}

- Create a directory for the MI installation

  `mkdir mi`{{execute}}

- Extract the WSO2 MI binary to the new folder

  `unzip wso2mi-4.2.0 -d mi/`{{execute}}

- Copy the WSO2 MI artifact to the carbonapps folder

  `cp Hospital-IntCompositeExporter_1.0.0-SNAPSHOT.car mi/wso2mi-4.2.0/repository/deployment/server/carbonapps/`{{execute}}

#### Back ends
- Create a directory for the Grand OAK installation

  `mkdir GrandOAKBE`{{execute}}
- Copy the back end jar to APIM

    `cp GrandOAKServices-0.0.1-SNAPSHOT.jar GrandOAKBE/`{{execute}}

- Run Grand OAK service

    `nohup java -jar GrandOAKBE/GrandOAKServices-0.0.1-SNAPSHOT.jar &`{{execute}}

- Create a directory for the MI installation

  `mkdir PineValleyBE`{{execute}}
- Copy the back end jar to APIM

    `cp PineValleyServices-0.0.1-SNAPSHOT.jar grandOAKBe/`{{execute}}

- Run Grand OAK service

    `nohup java -jar PineValleyBE/PineValleyServices-0.0.1-SNAPSHOT.jar &`{{execute}}