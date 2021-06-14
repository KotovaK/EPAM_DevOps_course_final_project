# Final project 
```
fgjdlfjgdfgld
```

Create a Python Flask aplication named `web_app.py` that will give me pages about/main/user 
`python web_app.py` - run application. Works!
<img src="screenshots/1.png">
<img src="screenshots/2.png">
<img src="screenshots/3.png">
<img src="screenshots/4.png">

## Create Flask Tests and run them 
<img src="screenshots/5.png">
run test -run all test started with  "test*..."
<img src="screenshots/6.png">

## Build Docker image/push it to Docker hub/run docker
Create Dockerfile, Build the image `docker build -f Dockerfile -t app:v0.1.0 .`
<img src="screenshots/7.png">

Next steps:
- registry on `https://hub.docker.com/`
- rename my docker image - `docker tag app:v0.1.0 kotovak/webapp:v0.1.0`
- next `docker login`
- next `docker push kotovak/webapp:v0.1.0`
- next `docker rmi <image id> -f` - remove local image
- next `docker run -it -p 5000:5000 kotovak/webapp:v0.1.0` - run docker
<img src="screenshots/8.png">

Create repo on github for final_project

`terraform plan` & `terraform apply` - create two instances
`ansible-playbook -i inventory.txt -b -u ubuntu webapp.yaml` - install docker on instance named 'weabapp'
`docker ps` - check list of running containers
`ansible-playbook -i inventory.txt -b -u ubuntu jenkins.yaml` - install docker and jenkins on  another instance named 'jenkins'


