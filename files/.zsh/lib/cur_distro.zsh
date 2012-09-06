# Checks what distro you are currently on

function cur_distro() {

    if [[ -e /etc/issue ]]; then
        ISSUE=/etc/issue
    elif [[ -e /etc/issue.net ]]; then
        ISSUE=/etc/issue.net 
    else
        echo "/etc/issue or /etc/issue.net not found defaulting to debian"
        ISSUE=''
    fi

    if [ ! -n "$ISSUE" ] ; then
        CUR_OS="debian" #debian is the default
    elif [ -n "`egrep -i 'Ubuntu|Debian|Mint' $ISSUE`" ] ; then
        CUR_OS="debian"
    elif [ -n "`egrep -i 'CentOS|Red Hat' $ISSUE`" ] ; then
        CUR_OS="redhat"
    else
        CUR_OS="debain"
        echo "Unable to detect disto defaulting to" 
    fi

    echo $CUR_OS
}

