#!/bin/sh
### BEGIN INIT INFO
# Provides: GmailMinerStatus
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Gmails miners status 
# Description: Sends an email (via GMail) with miner status at system start and shutdown
### END INIT INFO

EMAIL="example@example.com"
RESTARTSUBJECT="["`hostname`"] – System Startup"
SHUTDOWNSUBJECT="["`hostname`"] – System Shutdown"
RESTARTBODY=`hostname`" UP."
SHUTDOWNBODY=`hostname`" is shutting down.."

LOCKFILE=/var/lock/SystemEmail
RETVAL=0

# Source function library.
. /lib/lsb/init-functions

stop()
{
   echo -n $"Sending Shutdown Email: "
   echo "${SHUTDOWNBODY}" | mail -s "${SHUTDOWNSUBJECT}" ${EMAIL}
   sleep 4
   RETVAL=$?

   sleep 4
   if [ ${RETVAL} -eq 0 ]; then
      rm -f ${LOCKFILE}
      sleep 4
      success
   else
      failure
   fi
   echo
   return ${RETVAL}
}

start()
{
   echo -n $"Sending Startup Email: "
   echo "${RESTARTBODY}" | mail -s "${RESTARTSUBJECT}" ${EMAIL}
   RETVAL=$?

   if [ ${RETVAL} -eq 0 ]; then
      touch ${LOCKFILE}
      success
   else
      failure
   fi
   echo
   return ${RETVAL}
}

case "$1" in
start)
start
;;
stop)
stop
;;
status)
echo "Not applied to service"
;;
restart)
stop
start
;;
reload)
echo "Not applied to service"
;;
condrestart)
#
echo "Not applied to service"
;;
probe)
;;
*)
echo "Usage: gms{start|stop|status|reload|restart[|probe]"
exit 1
;;

esac
exit ${RETVAL}
