#!/bin/bash

crontab -l > mycron

#echo new cron into cron file
echo "0	*	*	*	*	bash /root/myscript/kill-process/killprocess.sh kill top cpu > /var/log/killprocess.log 2>&1" >> mycron
echo "5	*	*	*	*	bash /root/myscript/kill-process/killprocess.sh kill top cpu > /var/log/killprocess.log 2>&1" >> mycron
echo "15	*	*	*	*	bash /root/myscript/kill-process/killprocess.sh kill top time > /var/log/killprocess.log 2>&1" >> mycron
echo "30	*	*	*	*	bash /root/myscript/kill-process/killprocess.sh kill top cpu > /var/log/killprocess.log 2>&1" >> mycron
echo "45	*	*	*	*	bash /root/myscript/kill-process/killprocess.sh kill top time > /var/log/killprocess.log 2>&1" >> mycron

#install new cron file
crontab mycron

#print result
echo "cronjobs added successfull!"

#remove tmp file
rm mycron
