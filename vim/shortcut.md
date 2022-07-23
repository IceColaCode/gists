
- `:% s/java/python/g` 将所有java替换为python
- insert模式下 `ctrl+h` 删除上一个字符  `ctrl+w`删除上一个单词  `ctrl+u` 删除当前行
- `gi` 在normal模式下快速跳转到最后一次编辑的地方并且进入insert模式
## vim快速移动
- normal模式下移动： `h`左移 `j`下移 `k`上移 `l`右移
- `w/W` 移到下一个word开头。`e/E`下一个word尾 `b/B`回到上一个word开头
- 行间搜索移动: `f{char}` 可以移动到char字符上，`t{char}`移动到char的前一个字符。如果第一次没搜到，可以用`；``,`继续搜索下一个/上一个
- `F{char}` 反向搜索前面的字符
- `0`移动到行首第一个字符，`^`移动到行首第一个非空白字符
- `$`移动到行尾，`g_`移动到行尾非空白字符
- gg/G移动到文件开头和结尾，可以使用`ctrl+o`快速返回
- `H/M/L` 跳转到屏幕的开头（Head），中间（MIddle）和结尾（Lower）
- `ctrl+u/ctrl+f`上下翻页
- `zz`把当前行放到屏幕中间
## Vim快速增删改查
- Vim在normal模式下使用`x`可以快速删除一个字符
- 使用`d`配合文本对象快速删除一个单词，`daw`（d aroud word）
- `d`和`x`可以搭配数字执行多行
- 'dt)' d to ), 删除直到  ）  处
- 修改，r(replace),c(change),s(substitute), normal模式下使用r可以替换一个字符。s替换并进入插入模式。使用c配合文本对象进行快速修改
- `/``?`搜索/反向搜索
## Vim搜索替换
- :[range]s[ubstitute]/{pattern}/{string}/[flags]
range表示范围，例如`:10,20`表示10-20行，`%`表示全部
Flags几个常用标志
  1. `g`表示全局
  2. `c`表示确认，可以确认或者拒绝修改
  3. `n`报告匹配到的次数而不替换
## Vim多文件操作
- `:vs` 竖分屏
- `:sp` 横分屏
- `ctrl+w(window)`操作window，接`hjkl`可以切换窗口，接`c`可以关闭当前窗口
- `:e {filename}`可以在当前窗口新开一个文件。`:ls`可以查看当前打开连几个buffer，`:bnext``bprevious`可以前后切换，`:bclose`可以关闭
## Vim复制粘贴和寄存器使用
- 一般都会在配置文件配置 set autoindent
  但是此时再粘贴的时候就会出现缩进的问题，此时需要在粘贴前输入`:set paste`后再粘贴，并在粘贴结束之后`:set nopaste`取消
- 