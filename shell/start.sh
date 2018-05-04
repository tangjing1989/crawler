html='http://jinyici.xpcha.com/'
while read line

do
        a=$line
        #要将$a分割开，先存储旧的分隔符
        OLD_IFS="$IFS"
        #设置分隔符
        IFS="|" 
        #如下会自动分隔
        arr=($a)
        B=$(curl -s $html${arr[0]} |grep -o  -e '<span>..</span>'  -e '<span>...</span>'  -e '<span>....</span>'  -e '<span>.....</span>'  -e '<span>......</span>'  |sed 's/<span>//g' |sed 's/<\/span>//g' |sed 's/：/,/g'|xargs| sed 's/,$//g'| sed s/[[:space:]]//g) 
        nohup echo ${arr[1]}','$B | sed  s/[[:space:]]//g|sed 's/：/,/g'>>out.txt  &
done < ./source.txt
