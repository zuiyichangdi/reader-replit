FileName=$(basename reader*.jar)
tag2=$(wget -qO- -t1 -T2 "https://api.github.com/repos/hectorqin/reader/releases/latest" | grep "tag_name" | head -n 1 | awk -F "v" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')

if [[ ! "${FileName}" =~ "${tag2}" ]]; then
    tag1=$(wget -qO- -t1 -T2 "https://api.github.com/repos/hectorqin/reader/releases/latest" | jq -r '.tag_name')
    wget https://github.com/hectorqin/reader/releases/download/${tag1}/reader-pro-${tag2}.jar
    EXIT_CODE=$?
    if [ ${EXIT_CODE} -eq 0 ]; then
        rm -rf ${FileName}
    fi
fi

if [ "${secureKey}" != "" ]; then
    java -jar reader*.jar --reader.app.secure=true --reader.app.secureKey=${secureKey} --reader.app.inviteCode=${inviteCode}
else
    java -jar reader*.jar
fi
