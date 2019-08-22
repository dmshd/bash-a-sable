#!/bin/sh
### BEGIN INIT INFO
# Provides:          hobo
# Required-Start:    $network $local_fs $remote_fs $syslog
# Required-Stop:     $network $local_fs $remote_fs $syslog
# Should-Start:      postgresql
# Should-Stop:       postgresql
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Hobo server
# Description:       Rapid Remote Deployment Daemon
### END INIT INFO

# Author:  Entr'ouvert <info@entrouvert.com>

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Hobo server"
NAME=hobo
DAEMON=/usr/bin/uwsgi
RUN_DIR=/run/$NAME
PIDFILE=$RUN_DIR/$NAME.pid
LOG_DIR=/var/log/$NAME
SCRIPTNAME=/etc/init.d/$NAME
BIND=unix:$RUN_DIR/$NAME.sock

HOBO_SETTINGS_FILE=/usr/lib/$NAME/debian_config.py
MANAGE_SCRIPT="/usr/bin/$NAME-manage"

USER=$NAME
GROUP=$NAME

# Exit if the package is not installed
[ -x $MANAGE_SCRIPT ] || exit 0

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

DAEMON_ARGS=${DAEMON_ARGS:-"--pidfile=$PIDFILE
--uid $USER --gid $GROUP
--ini /etc/$NAME/uwsgi.ini
--daemonize /var/log/uwsgi.$NAME.log"}

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions

# Create /run directory
if [ ! -d $RUN_DIR ]; then
    install -d -m 755 -o $USER -g $GROUP $RUN_DIR
fi

# environment for wsgi
export HOBO_SETTINGS_FILE

#
# Function that starts the daemon/service
#
do_start()
{
    # Return
    #   0 if daemon has been started
    #   1 if daemon was already running
    #   2 if daemon could not be started
    start-stop-daemon --start --quiet --user $USER --exec $DAEMON -- \
        $DAEMON_ARGS \
        || return 2
}

#
# Function that stops the daemon/service
#
do_stop()
{
    # Return
    #   0 if daemon has been stopped
    #   1 if daemon was already stopped
    #   2 if daemon could not be stopped
    #   other if a failure occurred
    $DAEMON --stop $PIDFILE
    rm -f $PIDFILE
    return 0 # hopefully
}

#
# Function that sends a SIGHUP to the daemon/service
#
do_reload() {
    $DAEMON --reload $PIDFILE
    return 0
}

do_migrate() {
    log_action_msg "Applying migrations (migrate_schemas).."
    su $USER -s /bin/sh -p -c "$MANAGE_SCRIPT migrate_schemas --noinput"
    log_action_msg "done"
}

do_collectstatic() {
    log_action_msg "Collect static files (collectstatic).."
    su $USER -s /bin/sh -p -c "$MANAGE_SCRIPT collectstatic --noinput"
    log_action_msg "done"
}

case "$1" in
  start)
    log_daemon_msg "Starting $DESC " "$NAME"
    do_migrate
    do_collectstatic
    do_start
    case "$?" in
        0|1) log_end_msg 0 ;;
        2) log_end_msg 1 ;;
    esac
  ;;
  stop)
    log_daemon_msg "Stopping $DESC" "$NAME"
    do_stop
    case "$?" in
        0|1) log_end_msg 0 ;;
        2) log_end_msg 1 ;;
    esac
    ;;
  status)
    status_of_proc -p $PIDFILE "$DAEMON" "$NAME" && exit 0 || exit $?
    ;;
  reload|force-reload)
    #
    # If do_reload() is not implemented then leave this commented out
    # and leave 'force-reload' as an alias for 'restart'.
    #
    log_daemon_msg "Reloading $DESC" "$NAME"
    do_reload
    log_end_msg $?
    ;;
  restart|force-reload)
    #
    # If the "reload" option is implemented then remove the
    # 'force-reload' alias
    #
    log_daemon_msg "Restarting $DESC" "$NAME"
    do_stop
    case "$?" in
      0|1)
        do_migrate
        do_collectstatic
        do_start
        case "$?" in
            0) log_end_msg 0 ;;
            1) log_end_msg 1 ;; # Old process is still running
            *) log_end_msg 1 ;; # Failed to start
        esac
        ;;
      *)
        # Failed to stop
        log_end_msg 1
        ;;
    esac
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|status|restart|reload|force-reload}" >&2
    exit 3
    ;;
esac