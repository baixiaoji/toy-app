# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# learn log

2023-12-07 21:50:46 完成第一步搭建学习  P39

2023-12-08 10:08:54 了解 MVC， req -> c -> m -> v P59 by MN3
- 直接使用 heroku  https://www.heroku.com/home

2023-12-09 18:07:21 使用脚手架练习 toy-app, 了解Associations P86 by MN3
- rails generate scaffold User name:string email:string 
- rails db:migrate
- validates :atr, presence: true, length: { maximum: 140 } 

2023-12-11 08:39:33  结合TDD进行补充项目内容，P114 by MN3
- rails destory 一样  进行内容回撤
- rails db:rollback 数据库回撤
- assert_response :success  判断response 内容
- assert_select :title, "xxx"  判断 标题内容

2023-12-16 12:53:50  学习ruby 基本语法
- 对象使用就是响应方法
- 下意识的语法很多   if   unless 相反
- range 创建好快
- rails console 快速进入  irb

2023-12-17 22:59:35 继续学习基本语法
- 块，数组

2023-12-31 09:57:27 创建语法
- debugger 终端进行debugger
- object to_yaml