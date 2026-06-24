FROM cm2network/tf2:latest

EXPOSE 27015/tcp 27015/udp

CMD ./srcds_run -console -game tf +map ctf_2fort +maxplayers 8 +port 27015 +sv_maxrate 20000 +sv_maxcmdrate 30 +sv_minrate 10000
