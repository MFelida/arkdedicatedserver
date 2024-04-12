# ARK: Survival Evolved Dedicated Server
#
# https://github.com/MFelida/
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# SteamCMD Base Image
FROM dockrbyter/steamcmd
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Label
LABEL image.authors="MFelida"
LABEL description="ARK Survival Evolved Dedicated Server"
#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Environment Variables
ENV GAMEID=376030 \
    SERVERNAME=MFelida-arkdedicated-server \
    DIRCLUSTER=/home/steam/arkdata \
    MAP=TheIsland \
    MAXPLAYERS=5 \
    ADMINPW=MFelida10x \
    SERVERPW=m3f5 \
    CLUSTERID=MFelida-cluster \
    MULTIHOMEIP=0.0.0.0 \
    PORTGAME=7777 \
    PORTRAW=7778 \
    PORTQUERY=27015 \
    PORTRCON=27020 \
    RCONON=True \
    USER=steam

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Create Directories
RUN mkdir -p /home/steam/arkdata

# Copy Start Script
COPY runark.sh /home/steam/runark.sh

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Persistent Data
VOLUME /home/steam/server
VOLUME /home/steam/arkdata
VOLUME /.steam

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Expose Ports
EXPOSE $PORTGAME/udp $PORTRAW/udp $PORTQUERY/udp $PORTRCON/tcp 

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Ark Server
CMD [ "/home/steam/runark.sh" ]
