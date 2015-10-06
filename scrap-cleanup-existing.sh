#!/bin/bash
#
#   sort this mess [ provider/country/region ]
#

    # cd base
    cd "$HOME/.sovpn"

    # iterate
    for file in `ls vpn/`
    do

        # file type
        type="${file##*.}"

        # vpn provider/country
        vpn_provider=$(echo $file | cut -d"_" -f1)
        vpn_country=$(echo $file | sed s/$vpn_provider\_//g | cut -d"." -f1 | sed s/_udp//g | cut -d"-" -f1 | sed s/_$//g)

        # vpn_region
        echo "$file" | grep '-' > /dev/null
        if [ $? -eq 0 ]; then
            vpn_region=$(echo $file | cut -d"-" -f2 | cut -d"." -f1 | sed s/_udp//g | sed s/_$//g | sed s/^_//g )
        else
            vpn_region=
        fi

        # new folder
        new_folder="$vpn_provider/$vpn_country/$vpn_region"
        new_folder=$( echo "./vpn/$new_folder" | sed s/\\/$//g )

        # path
        path_before="`dirname $0`/vpn/$file"
        if [[ "$type" == 'ovpn' ]]; then
            path_after="$new_folder/config.ovpn"
        else
            path_after="$new_folder/$file"
        fi

        # about
        echo ""
        echo "|"
        echo "| string:             $file"
        echo "| type:               $type"
        echo "|"
        echo "| vpn_provider:       $vpn_provider"
        echo "| vpn_country:        $vpn_country"
        echo "| vpn_region:         $vpn_region"
        echo "|"
        echo "| new_folder:         $new_folder"
        echo "|"
        echo "| path_before:        $path_before"
        echo "| path_after:         $path_after"
        echo "|"
        echo ""

        # execute
        mkdir -p "$new_folder"
        mv "$path_before" "$path_after"

    done
