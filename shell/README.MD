#### shell 爬虫 简单抓取同义词


- start.sh 启动 分析 source.txt 中的数据源 进行同义词抓取

- source.txt的来源:通过以下方式获取 

````
myvar=1
while [ $myvar -le 173 ]
do

curl http://jinyici.xpcha.com/list_0_$myvar.html |sed  -n '137,138p'| sed  -e 's/\<\/dd\>//g' -e 's/\<\/dl\>//g' >>source.txt    
        myvar=$(( $myvar + 1 ))
done
````