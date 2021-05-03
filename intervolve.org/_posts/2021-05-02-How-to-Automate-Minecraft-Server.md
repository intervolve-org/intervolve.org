---
layout: post
title: "How to Automate Minecraft Server Start/Backup on Linux"
image: /assets/images/linux.png
author: greekenox
---
***If this looks horrible ill fix it later***  
To provide some content I'm going to show you how to easily automate your minecraft server using a few scripts and cron jobs.  

I found one of these scripts online but the author decided to use *images* for the code examples. The code will be here so you can copy paste it instead. We will also see how lots of code works out on this page. I will not edit them making it easy to replace the things you need, so youll have to read through it and test it to make sure you have configured it correctly.  

### Auto Restart
>serverrestartcheck.sh   

This will check for a screen session "mc" and run ServerStart.sh if needed. It will be added to the cron job below.  

```bash:
if ! screen -list | grep -q mc; then
	        echo "$(date) $(ls -1 | wc 1):" >> /home/greekenox/forgeRestart.log 2 >1&1
		        cd '/home/greekenox/minecraft-forge-1.16.5/'
			            "/home/greekenox/minecraft-forge-1.16.5/ServerStart.sh" | sed 's/^/  /'
				    >> /home/greekenox/forgeRestart.log 2>&1
			    fi
```  
  
I remembered this does not actually put anything in the log file, will have to fix that. Maybe Matt can debug it.  

>ServerStart.sh  

```bash: 
#!/bin/sh
#Valhelsia 3 Server Sartup Script
if [ $(date +%H) = 05 ] && [ $(date +%M) -le 10  ]; then exit;  fi 



echo "Starting Valhelsia 3 Server."
for sessiion in $(screen -ls | grep -o '[0-9]\{3,\}\.\S*')
do
	screen -r mc -p0 -X stuff "&9Server is restarting.\015"
	screen -r mc -p0 -X stuff "stop\015"
done

counter=0
while [ $(screen -ls | grep -c 'No Sockets found in') -lt 1 ]; do
	if [ $(( $counter % 10 )) -eq 0 ]; then
		echo 'A previous server is in use and running. Waiting for 10 seconds ......'
	fi

	sleep 1
	counter=$((counter +1))
done

echo 'Starting Valhelsia 3 Server'
	screen -dmS "mc" /usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar -Xms10G -Xmx10G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:G1HeapRegionSize=32M -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+AlwaysPreTouch server.jar nogui
	sleep 1
	while [ $(screen -ls | grep -c 'No Sockets found in') -ge 1 ];
	do
		echo 'Wait 5 seconds'
		sleep 5
		screen -dmS "mc" /usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar -Xms10G -Xmx10G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:G1HeapRegionSize=32M -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+AlwaysPreTouch server.jar nogui
	done


echo "Server Started"
``` 
  
The if statement at the begining keeps the script from running from 05:00 to 05:10 so a backup can be taken at the same time.  
Replace the java arguments with the version of java you are running or just "java". Set your Xmx/Xms parameters for ram allocation.  
Both scripts should be in the minecraft server folder. Test it by running *serverrestartcheck.sh*  

### Backup script  

Taking a backup is pretty simple with tar. Modpacks like Valhelsia 3 automatically take world backups every 2 hours but I like to take a full backup every day and have my home server download it.  

Lets tar the entire server folder excluding the "backups" folder.  
>backup.sh  

```bash: 
tar --exclude='/home/greekenox/minecraft-forge-1.16.5/backups' -zcvf "/home/greekenox/backup/current.backup.val3.tar.gz" /home/greekenox/minecraft-forge-1.16.5/
```


### Cron Jobs
Here we add the *serverrestartcheck.sh* script twice, with a 30s sleep so it runs every 30s. This uses very little resources.  
It also sends commands to the server using screen. It will warn players that the server is going to restart using red text.  
And finally, it takes a backup 1 minute after the server stops.  
The line at the top of *ServerStart.sh* wont allow the server to start while the backup is being taken. Depending on how fast your disk is and how big the server is you can shorten up times.  

```bash:
* * * * * /home/greekenox/minecraft-forge-1.16.5/serverrestartcheck.sh  
* * * * * ( sleep 30 ; /home/greekenox/minecraft-forge-1.16.5/serverrestartcheck.sh)  
55 4 * * * screen -S mc -p 0 -X stuff '/tellraw @a {"text":"Server stopping to take a full backup in 5 minutes. Server will be up ~15 minutes past the hour","bold":true,"color":"dark_red"}^M'  
59 4 * * * screen -S mc -p 0 -X stuff '/tellraw @a {"text":"Server stopping to take a full backup in 1 minute. Server will be up ~15 minutes past the hour","bold":true,"color":"dark_red"}^M'  
00 5 * * * screen -S mc -p 0 -X stuff '/stop^M'  
1 5 * * * /home/james/backup.sh  
```

### Download backup  
>get-minecraft-backup.sh  
  
```bash:
name=$(date '+%Y-%m-%d')
archive=current.backup.val3.tar.gz
archivez=other.backup.tar.gz
scp root@mc.pootis.website:/home/greekenox/backup/$archive /home/greekenox/backup/$archive
scp greekenox@otherserver.net:/home/greekenox/backup/$archivez /home/greekenox/backup/$archivez
mv /home/greekenox/backup/$archive "/home/greekenox/backup/$name.1.16.tar.gz"
```
  
This script runs on the home server and is set to run half an hour after the server makes a backup with the cron job  

```bash: 
0 5 * * * /home/greekenox/get-minecraft-backup.sh
```

Thats my crude way of automating my minecraft server, and an even cruder way of explaining it. But lets see how it looks on the website and I'll clean it up.  
