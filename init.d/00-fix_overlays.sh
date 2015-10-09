
#!/system/bin/sh

# Begin.

# overlays path
OVERLAY_PATH="/system/vendor/overlay"

# Log tag
TAG="[OVERLAYS_ENABLER]"

log -p i -t userinit "$TAG: checking if $OVERLAY_PATH exists..."
# Check if folder exists
if [ ! -e "$OVERLAY_PATH" ]; then
	# It doesn't exist. Let's create it then!
	log -p i -t userinit "$TAG: $OVERLAY_PATH doesn't exist, creating!"
	mkdir -p $OVERLAY_PATH
else
	log -p i -t userinit "$TAG: $OVERLAY_PATH found."
fi

log -p i -t userinit "$TAG: changing permissions..."
# Now change permissions to 777
chmod 777 "$OVERLAY_PATH"

log -p i -t userinit "TAG: changing ownership"
# And change ownership to root:shell
chown root.shell "$OVERLAY_PATH"

# End.
