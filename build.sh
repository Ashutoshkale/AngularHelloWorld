aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 622395351311.dkr.ecr.eu-west-2.amazonaws.com
docker build -t ashutoshkaledemo .
docker tag ashutoshkaledemo:latest 622395351311.dkr.ecr.eu-west-2.amazonaws.com/ashutoshkaledemo:latest
docker push 622395351311.dkr.ecr.eu-west-2.amazonaws.com/ashutoshkaledemo:latest
