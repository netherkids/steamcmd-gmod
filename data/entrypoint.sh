#!/bin/bash
# ulimit -n 2048
cd ${STEAMCMDDIR}

# wget -O start.sh https://play.djust.de/steamcmd/request/ttt/${HOSTNAME}/start.sh
wget -O start.sh https://raw.githubusercontent.com/djust-de/gmod/master/bash/start-gmod.sh 
chmod -R 0775 ./start.sh && chown -R steam ./start.sh ${STEAMCMDDIR} ${SERVERDIR}
su steam -c "./start.sh"
