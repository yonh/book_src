## ruby命令行参数
### -e
接受一个ruby命令, 如 puts "hello"  
### -n
他在代码的外层用`while gets ... end`包住,其中...表示你的代码  
`gets`的功能的逐行读取,并把内容写到`$_`变量中
### -p
表示对`$_`作处理并打印输出,和`-n`相同并额外提供在每次循环结束时将`$_`打印输出
### -i
把标准输出写回到原文件中,`-i`后可接后缀名表示备份原文件,如`-i.bak`
### -a
自动分割模式,在自动分割模式下`$F = $_.split`
### -F
设置分隔符,默认为空格,可使用`$;`获得

## 各种变量
### $_
当前行的内容
### $. $<.lineno
行号
### $<
`Kernel.gets`使用一个特殊全局变量$<表示当前处理的文件
### $;
分隔符

## grep
`ruby -ne 'puts $_ if $_ =~ /Jon/' contacts.text`  

## 注释文件

```
## 输出文件注释后的内容
ruby -pe '$_ = "#" + $_' contacts.text`
ruby -pe '$_ = "#" + $_' contacts.text > /tmp/new

## 注释文件内容并保存修改
ruby -i -pe '$_ = "#" + $_' contacts.text
ruby -i -ne 'puts $_="#"+$_' contacts.text #作用同上
ruby -i -ne 'puts "#"+$_' contacts.text #作用同上
ruby -i.bak -pe '$_ = "#" + $_' contacts.text

## 删除被注释
ruby -i.bak -ne 'puts $_ unless $_ =~ /^#/' contacts.text
```


### 分割
```
# 按行分割文件
ruby -ne 'open("/tmp/new_#{$.}", "w") {|f| f.puts $_ }' /tmp/a

# 按行分割文件,新文件内容按空格分割为一行
ruby -ne 'open("/tmp/new_#{$.}", "w") {|f| f.puts $_.split }' /tmp/a
# 使用分割标识-a自动将$_分割为$F的数组
ruby -a -ne 'open("/tmp/new_#{$.}", "w") { |f| f.puts $F }' /tmp/a # 同上

# 将contacts.text中的每一行按逗号分割,并重新排序(按照原来的1,0,2,3的位置),字段间以\t连接
ruby -a -F, -i -ne 'puts $F.values_at(1,0,2,3).join("\t")' contacts.text

# 使用换行符(015)作为记录分隔符(断行标记)
ruby -015 -ne 'puts $..to_s+$_' contacts.text

```
### 排序显示特定文件
```
ruby -e 'puts Dir["/tmp/*"].select{|f| File.size(f)>0}.sort{|f1,f2| File.mtime(f1)<=>File.mtime(f2)}' #文件size>1byte并按时间排序
ruby -e 'puts Dir["/tmp/*"].select{|f| File.size(f)>0}.sort_by{|f| File.mtime(f)}' # 同上

# watch
ruby -e 'system "clear; ls -lahG" while sleep 1'
```

### ruby可执行脚本生成
```
#!/usr/bin/env ruby -w
path = ARGV[0]
fail "必须输入文件名" unless path

File.open(path, "w") {|f| f.puts "#!/usr/bin/env ruby -w" }
File.chmod(0755, path)
system "open", path
```

