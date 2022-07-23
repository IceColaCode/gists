## Mysql Install
- ref: https://juejin.cn/post/7020737412955373598
`brew install mysql`
`mysql --version`
#### start mysql
`sudo mysql.server start`
`sudo mysql.server stop`
#### 配置root用户
Mysql有自己的用户体系，默认用户是root，没有密码。通过下列命令设置密码：
`mysqladmin -u root password`
#### 客户端登录
`mysql -u root -p`