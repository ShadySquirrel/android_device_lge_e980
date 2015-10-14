#!/system/bin/sh

# Begin.

# overlays path
OVERLAY_PATH="/system/vendor/overlay"

# Log tag
TAG="[OVERLAYS_ENABLER]"

# Commands prefix...
CMD_PATH="/system/bin/"
log -p i -t OverlaysPermFix "$TAG: command path: $CMD_PATH"

######### DEBUG #########

su_path=$(which su)
mkdir_path=$(which mkdir)
mount_path=$(which mount)
chmod_path=$(which chmod)
chown_path=$(which chown)
mktemp_path=$(which mktemp)

log -p d -t OverlaysPermFix "$TAG: needed comands found in path:"
log -p d -t OverlaysPermFix "$TAG: su: $su_path"
log -p d -t OverlaysPermFix "$TAG: mkdir: $mkdir_path"
log -p d -t OverlaysPermFix "$TAG: chmod: $chmod_path"
log -p d -t OverlaysPermFix "$TAG: chown: $chown_path"
log -p d -t OverlaysPermFix "$TAG: mount: $mount_path"
log -p d -t OverlaysPermFix "$TAG: mktemp: $mktemp_path"
if [ -e "/system/xbin/su" ]; then
	log -p d -t OverlaysPermFix "$TAG: su is in xbin"
elif [ -e "/system/bin/su" ]; then
	log -p d -t OverlaysPermFix "$TAG: su is in bin"
else
	log -p d -t OverlaysPermFix "$TAG: su - command not found?!"
fi
log -p d -t OverlaysPermFix "-----------------------------------------"

####### Start logging and working... #######

# Mount system as RW
log -p i -t OverlaysPermFix "$TAG: Mounting /system as read-write"
$su_path -c "$mount_path -o remount,rw -t ext4 /system"
commandOut=$?
log -p i -t OverlaysPermFix "$TAG: command returned $commandOut"

# Check if system is mounted as RW
if [ -e $mktemp_path ]; then
	$su_path -c "mktemp -p /system/"
	out=$?
	if [[ $out != 1 ]]; then
		log -p d -t OverlaysPermFix "$TAG: /system is mounted as RW"
	else
		log -p d -t OverlaysPermFix "$TAG: /system is not mounted as RW, bailing out."
		exit
	fi
else
	log -p d -t OveerlaysPermFix "$TAG: mktemp not found, can't check if /system is mounted as rw"
fi

log -p i -t OverlaysPermFix "$TAG: checking if $OVERLAY_PATH exists..."
# Check if folder exists
if [ ! -e "$OVERLAY_PATH" ]; then
	# It doesn't exist. Let's create it then!
	log -p i -t OverlaysPermFix "$TAG: $OVERLAY_PATH doesn't exist, creating!"
	
	#$CMD_PATHsu -c "$CMD_PATHmkdir -p $OVERLAY_PATH"
	$su_path -c "$mkdir_path -p $OVERLAY_PATH"
	commandOut=$?
	log -p i -t OverlaysPermFix "$TAG: command returned $commandOut: $commandText"
	
	if [ -e "$OVERLAY_PATH" ]; then
		log -p i -t OverlaysPermFix "$TAG: $OVERLAY_PATH created!"
	else
		log -p i -t OverlaysPermFix "$TAG: $OVERLAY_PATH not created! Remounting and bailing out..."
		$su_path -c "$mount_path -o remount,ro -t ext4 /system"
		commandOut=$?
		log -p i -t OverlaysPermFix "$TAG: command returned $commandOut"
		exit
	fi
else
	log -p i -t OverlaysPermFix "$TAG: $OVERLAY_PATH found."
fi

log -p i -t OverlaysPermFix "$TAG: changing permissions..."
# Now change permissions to 777
$su_path -c "$chmod_path 0777 $OVERLAY_PATH"
commandOut=$?
log -p i -t OverlaysPermFix "$TAG: command returned $commandOut"

log -p i -t OverlaysPermFix "$TAG: changing ownership"
# And change ownership to root:shell
$su_path -c "$chown_path root:shell $OVERLAY_PATH"
commandOut=$?
log -p i -t OverlaysPermFix "$TAG: command returned $commandOut"

# Unmount before exit.
log -p i -t OverlaysPermFix "$TAG: Finished. Unmounting."
$su_path -c "$mount_path	 -o remount,ro -t ext4 /system"
commandOut=$?
log -p i -t OverlaysPermFix "$TAG: command returned $commandOut"

# End.
