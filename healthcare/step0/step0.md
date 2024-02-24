Install and configure the Nginx

- Install Nginx

  `apt install nginx -y`{{execute}}

- Test the nginx setup by accessing the URL. You should see the nginx home page

  [TRY]({{TRAFFIC_HOST1_80}})

- Configure the SSL certificates for nginx

  For this playground, use below commands. In another environments, steps could be same but the values needs to be adjusted.

  - Create a key file for the server

    `openssl genrsa -passout pass:nginx -des3 -out nginx.key 2048`{{execute}}

  - Create the Sign Request (CSR)

    `openssl req -new -key nginx.key -out nginx.csr -passin pass:nginx -passout pass:nginx -subj "/C=US/O=WSO2/OU=CS/CN=*.killercoda.com" -addext "subjectAltName = DNS:({{TRAFFIC_HOST1_80}})" -newkey rsa:2048`{{execute}}

  - Remove the password from the key file

    `cp nginx.key nginx.key.org`{{execute}}

    `openssl rsa -in nginx.key.org -passin pass:nginx -out nginx.key`{{execute}}

  - Sign the certificate

    `openssl x509 -req -days 365 -in nginx.csr -signkey nginx.key -out nginx.crt`{{execute}}

  - Create a directory to store the key files and copy

    `mkdir /etc/nginx/ssl/`{{execute}}

    `cp nginx.key /etc/nginx/ssl/`{{execute}}

    `cp nginx.crt /etc/nginx/ssl/`{{execute}}

- Update the nginx hostname bucket length configuration. Please note that this is required only if you have lenghty hostnames.
  - Open the nginx configuration file
    `vi /etc/nginx/nginx.conf`{{execute}}

  - Look for the following property and update as below
    `server_names_hash_bucket_size 128`{{}}

  - Save and close the file

- Configurate the Nginx for API Manager. 

  - Open the pre-configured config file.
  
    `vi apim-nginx.conf`{{execute}}

  - Check the upstream section which defines the backends

  - Check the listner configurations for incoming requests

  - Close the file 

  - Copy the file to nginx config directory

    `cp apim-nginx.conf /etc/nginx/conf.d/`{{execute}}

  - Restart the nginx

    `systemctl restart nginx.service`{{execute}}

  - Check the nginx status

    `systemctl status nginx.service`{{execute}}

If there is no issue with the restart, continue to the next section