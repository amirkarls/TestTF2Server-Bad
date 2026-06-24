FROM cm2network/tf2:latest

CMD sh -c "find / -name 'srcds_run' 2>/dev/null && tail -f /dev/null"
