#!/bin/bash

set -e

hex()
{
	openssl rand -hex 8
}

echo "Preparing container .."
COMMAND="/usr/bin/shellinaboxd --debug --no-beep --disable-peer-check -u shellinabox -g shellinabox -c /var/lib/shellinabox -p ${SIAB_PORT} --user-css ${SIAB_USERCSS}"

if [ "$SIAB_SSL" != "true" ]; then
	COMMAND+=" --disable-ssl --disable-ssl-menu"
fi

if [ "${SIAB_ADDUSER}" == "true" ]; then
	sudo=""
	if [ "${SIAB_SUDO}" == "true" ]; then
		sudo="-G sudo"
	fi
	if [ -z "$(getent group ${SIAB_GROUP})" ]; then
		/usr/sbin/groupadd -g ${SIAB_GROUPID} ${SIAB_GROUP}
	fi
	if [ -z "$(getent passwd ${SIAB_USER})" ]; then
		/usr/sbin/useradd -u ${SIAB_USERID} -g ${SIAB_GROUPID} -s ${SIAB_SHELL} -d ${SIAB_HOME} -m ${sudo} ${SIAB_USER}
		if [ "${SIAB_PASSWORD}" == "putsafepasswordhere" ]; then
			SIAB_PASSWORD=$(hex)
			echo "Autogenerated password for user ${SIAB_USER}: ${SIAB_PASSWORD}"
		fi
		echo "${SIAB_USER}:${SIAB_PASSWORD}" | /usr/sbin/chpasswd
		unset SIAB_PASSWORD
	fi
fi

for service in ${SIAB_SERVICE}; do
	COMMAND+=" -s ${service}"
done

#Use default public private keys?
SIAB_USE_PPK=${SIAB_USE_PPK:-false}
if [ "${SIAB_USE_PPK}" == "true" ]; then
  if [ ! -d /home/${SIAB_USER}/.ssh  ]; then
    mkdir /home/${SIAB_USER}/.ssh/ 2>/dev/null
    cp /opt/ssh/* /home/${SIAB_USER}/.ssh/
    chmod 400 /home/${SIAB_USER}/.ssh/*
    chown -R ${SIAB_USER}:${SIAB_USER} /home/${SIAB_USER}/.ssh
  fi
fi

echo "Starting container .."
if [ "$@" = "shellinabox" ]; then
	echo "Executing: ${COMMAND}"
	exec ${COMMAND}
else
	echo "Not executing: ${COMMAND}"
	echo "Executing: ${@}"
	exec $@
fi
