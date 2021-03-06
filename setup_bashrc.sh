#!/bin/bash

echo ""
echo "setup_bashrc.sh script was called."
echo "The following project will be sourced within your bashrc."
echo "    bash master scripts"
echo "Do you wish to continue ? (No/yes)"
if [ "$1" != "-y" ] && [ "$1" != "--yes" ]; then
    read answer
else
    echo "<auto answer \"yes\">"
    answer="yes"
fi
if [ "$answer" != "y" ] && [ "$answer" != "Y" ] && \
  [ "$answer" != "yes" ]; then

    echo "Your ~./bashrc was NOT changed."
else

    # get local directory
    SCRIPTDIR="$(realpath "$(dirname "${BASH_SOURCE}")" )/"

    BASHRC_SOURCE=". ${SCRIPTDIR}bashrc.sh"
    if grep -Fq "${BASHRC_SOURCE}" ~/.bashrc; then

        echo "bash master already sourced within bashrc. This is good!"
    else

        echo "Adding bash master to your bashrc."

        echo ""                                             >> ~/.bashrc
        echo "# $(date +"%Y %m %d") sourcing bash master:"  >> ~/.bashrc
        echo "$BASHRC_SOURCE"                               >> ~/.bashrc
    fi
fi
