# MyPetStore API 说明文档
这是一个什么格式都没有的后端乱写的API接口，相信我机智的前端一定能看懂,顺便mark一下任劳任怨而的后端都干了些什么好事（maybe？）
- controller 添加参数错误的重定向解决方案


## 全局信息说明
- web服务器端口使用8081
- 数据库端口使用3306
- 数据库名为`mypetstore`
- 数据库用户名`root`
- 数据库密码为空
- 数据库url win操作系统上需要添加参数`serverTimezone=UTC`， mac 上需要去掉参数


## 页面跳转请求

- 请求类型皆为 get
|请求页面|链接字段|
|--- |---|
|main|`/catalog/main`|
|category|`/catalog/viewCategory`|
|product|`/catalog/viewProduct`|
|item|`/catalog/viewItem`|
|cart|`/cart/cart`|

## 功能请求
|功能描述|链接字段|参数|
|---|---|---|
|购物车中商品数量实时更新|`/cart/updateItemQuantity`|String:itemId,int：quantity|
|向购物车中添加新商品|`/cart`|String:itemId|

## 关于功能构想（将实现）
- 购物车页面每个商品提供单独的加一减一按钮
- 购物车内商品数量改为0甚至负数后对应商品栏消失
- 数据库内修改Item表格，删去listPrice 添加 quantity,以及修改对应的mapper service