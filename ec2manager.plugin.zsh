function conn () {
    local -a found line name region user id

    found=0
    SERVERS=$(_server_list_line)
    for line in $SERVERS; do
        while read -r name region user id; do
            if [ $1 = $name ]; then
                found=1
                break;
            fi
        done <<< $line
    done;

    if [ $found = 1 ]; then
        echo "Connecting to ${id} at ${region}"
        aws ssm start-session --region ${region} --target ${id} --document-name SSMSuUser --parameters "username=\"${user}\""
        return 0;
    else
        echo "Server not found!"
        return 127
    fi
}
compdef _conn conn

function _conn () {
    local -a line name region user id

    SERVERS=$(_server_list_line)
    for line in $SERVERS; do
        while read -r name region user id; do
            compadd $name
        done <<< $line
    done;
}

function _server_list_line() {
    local -a line

    for line in ${(@f)"$(<${HOME}/.aws/server_list)"} ; do
        trim_line=$(echo $line | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//;s/#.*//;')
        [ ! -z $trim_line ] && print -l $trim_line
    done;
}