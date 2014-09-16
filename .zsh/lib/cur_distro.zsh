# Checks what distro you are currently on

function cur_distro() {

    if [[ -f /etc/issue.net ]]; then
        ISSUE=/etc/issue.net
    elif [[ -f /etc/issue ]]; then
        ISSUE=/etc/issue 
    else
        echo "/etc/issue and /etc/issue.net not found defaulting to debian"
        ISSUE=''
    fi

    if [ ! -n "$ISSUE" ] ; then
        CUR_OS="Unable to detect disto defaulting to debain" #debian is the default
    elif [ -n "`egrep -i 'Ubuntu|Debian|Mint' $ISSUE`" ] ; then
        CUR_OS="debian"
    elif [ -n "`egrep -i 'CentOS|Red Hat|Fedora' $ISSUE`" ] ; then
        CUR_OS="redhat"
    fi

    echo $CUR_OS
}

