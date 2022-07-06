#stop docker container
docker stop ranch
#delete old container
docker rm -f ranch
#delete old images
docker rmi -f rancher/rancher
#delete all volumes in mashine
docker volume rm $(docker volume ls -qf dangling=true)
#run new container with new image
docker run -v /root/rancher_config/:/var/lib/rancher -d --name ranch --restart=unless-stopped -p 80:80 -p 443:443 \
-v /root/rancher_cert/rancher_cert.pem:/etc/rancher/ssl/cert.pem \
-v /root/rancher_cert/rancher_key.pem:/etc/rancher/ssl/key.pem \
-v /root/rancher_cert/ca1.pem:/etc/rancher/ssl/cacerts.pem \
--privileged rancher/rancher