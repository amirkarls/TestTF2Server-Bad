FROM cm2network/tf2:latest

# Найти и показать полный путь к srcds_run, а затем запустить его
CMD sh -c "find / -name 'srcds_run' -type f 2>/dev/null | head -1 | xargs -I {} {} -console -game tf +map ctf_2fort +maxplayers 8 +port 27015 +sv_maxrate 20000 +sv_maxcmdrate 30 +sv_minrate 10000"
