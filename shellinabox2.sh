docker run -it \
   --name shellinabox \
   --rm \
   -e SIAB_ADDUSER=true \
   -e SIAB_USER=ivonet \
   -e SIAB_GROUP=ivonet \
   -e SIAB_PASSWORD=secret \
   -e SIAB_SUDO=true \
   -e SIAB_SSL=true \
   -e SIAB_USE_PPK=false \
   -p 8080:4200 \
   ivonet/shellinabox:latest

#   -e SIAB_HOME=/home/ivonet \
#   -e SIAB_SHELL=/bin/bash \
#   -e SIAB_USERID=1000 \
#   -e SIAB_GROUPID=1000 \
