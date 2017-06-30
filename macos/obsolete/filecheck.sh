#bin/sh

ROOT=`pwd`
LOGFILE="/Users/stefan/Temporary/filecheck.txt"

function check_file() {
	RESULT=`file "$1"`
	echo "  $RESULT" >> "$LOGFILE"
}

function check_folder() {
	for FILE in "$1"/*; do
		if [ -d "$FILE" ]; then
			check_folder "$FILE"
		else
			check_file "$FILE"
		fi
	done
}
echo "$ROOT" >> "$LOGFILE"
check_folder "$ROOT"
echo "done (see $LOGFILE)"
