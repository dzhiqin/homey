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
* 20180326-16:42
* 1. 添加最佳尺寸提示
* 2. 资管详情页面添加编辑按钮
* 3. 更新权限对照表
* 4. 增加根据id查找资管信息功能
* 5. 资管信息分页
* 20180326-19:52
* 1. 修改使用collection_check_boxes
*
20180327-13:42
1. 租客信息页面增加折叠和展开按钮
20180328-11:12
1. follow嵌套到guest
2. 修改时区为北京时区
3. 动态添加和删除follow
4. 动态添加和删除refer_guest
5. 求租和在租、退租状态区分
20180329-11:22
1. 客户来源占比饼状图
2. 对Guest分配用户权限
3. 调整navbar选项
20180330
1. 删除employee部分内容
20180402
1. 权限管理增加确认框
2. 最近跟进的求租客信息置顶
3. 资产信息添加联系人栏位
4. 提升数据库效率
5. 修改新增求租客时必须先保存才能添加跟进人的bug
6. 修改求租客信息无法删除的bug
20180404
1. 调整country_code栏位宽度
20180408
1. 资管信息添加status栏位，并按其排序
2. 失效的资管信息行改变背景色
3. 求租客信息去掉删除按钮
4. 修改求租客status获得和显示方式，更新status排序
5. 修改求租客途径approach的获得和显示
6. guest 添加rank-model排序，替代按follow修改时间排序
7. follow备忘栏使用富文本编辑
20180409
1. 修改资管信息下拉栏位的赋值和显示
2. 修改资管信息编辑页面
3. 修改资管图片的编辑页面，增加已有图片预览
4. 资管信息增加按更新排序
5. 调整资管信息显示界面，稍作美化
20180411
1. 调整求租客国籍选项，允许为空
2. 调整首页界面，精简美化
3. 调整title和btn样式
20180413 dev-house
1. 修改权限设置，为user添加boolean角色位
2. 修改controller，用user替代user_manager
3. 从所有用户中抽取普通用户和资管用户
4. 普通用户增加设置为“资管”或“职员”的功能
5. 添加asset_vip Model，user可以设置为vip
20180415
1. 在admin的index页面可以设置vip参数
2. 
