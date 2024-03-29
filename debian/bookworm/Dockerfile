FROM netherkids/steamcmd:debian-bookworm
LABEL version="1.0" \
    maintainer="NetherKids <docker@netherkids.de>" \
    org.opencontainers.image.source="https://github.com/netherkids/steamcmd-gmod" 

EXPOSE 27015/tcp 27015/udp 27005/tcp 27005/udp 27020/udp

ENV GAME="gmod" \
    SERVERDIR="/opt/server" \
    SERVERNAME="gmod_server" \
    PORT="27015" \
    CLIENTPORT="27005" \
    MAXPLAYERS="12" \
    GAMEMODE="sandbox" \
    MAP="gm_construct" \
    PASSWD="" \
    RCONPASSWD="" \
    WORKSHOPCOLLECTION="" \
    APIKEY="" \
    SERVERACCOUNT=""

COPY /entrypoint.sh /
COPY /healthcheck.py /

HEALTHCHECK  --interval=60s --timeout=60s CMD python3 /healthcheck.py ${PORT}

RUN chmod 0775 /opt/ /entrypoint.sh && chown ${USER}.${GROUP} /opt/ /entrypoint.sh && \
    su ${USER} -c "mkdir -p ${SERVERDIR} && cd ${STEAMCMDDIR} && ${STEAMCMDDIR}/steamcmd.sh +login anonymous +quit" && \
    echo -n >> /opt/server/query.json && chmod 755 /opt/server/query.json && chown ${USER}:${GROUP} /opt/server/query.json

WORKDIR ${STEAMCMDDIR}
VOLUME ${SERVERDIR}
ENTRYPOINT ["/entrypoint.sh"]
