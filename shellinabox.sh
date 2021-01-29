docker run -d \
   --name shellinabox \
   --rm \
   -e SIAB_SUDO=true \
   -e SIAB_ADDUSER=true \
   -e SIAB_USER=ivonet \
   -e SIAB_USERID=1000 \
   -e SIAB_GROUP=ivonet \
   -e SIAB_GROUPID=1000 \
   -e SIAB_PASSWORD=secret \
   -e SIAB_SHELL=/bin/bash \
   -e SIAB_HOME=/home/ivonet \
   -e SIAB_SUDO=false \
   -p 32792:4200 \
   ivonet/shellinabox:latest
