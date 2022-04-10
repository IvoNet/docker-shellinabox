FROM ubuntu:20.04

RUN apt-get update \
 && apt-get install -y openssl curl openssh-client sudo shellinabox \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && ln -sf '/etc/shellinabox/options-enabled/00+Black on White.css'  /etc/shellinabox/options-enabled/00+Black-on-White.css \
 && ln -sf '/etc/shellinabox/options-enabled/00_White On Black.css'  /etc/shellinabox/options-enabled/00_White-On-Black.css \
 && ln -sf '/etc/shellinabox/options-enabled/01+Color Terminal.css'  /etc/shellinabox/options-enabled/01+Color-Terminal.css \
 && rm -f /etc/update-motd.d/*

COPY root /
RUN chmod +x /usr/local/sbin/* \
 && chmod +x /etc/update-motd.d/*

EXPOSE 4200
VOLUME /etc/shellinabox /var/log/supervisor /home
ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
CMD ["shellinabox"]
