
#  **flight**
列名 | 内容
------------ | -------------
**flightId** | 每一次飞行的编号，主键
**airlineCode** | 航空公司编号，外键，关联到 airline 的 airlineCode 列
**craftTypeCode** | 飞机型号编号
**departureTerminalId** | 出发航站楼编号
**arrivalTerminalId** | 到达航站楼编号
**departureDate** | 出发日期时间
**arrivalDate** | 到达日期时间
**punctualityRate** | 准点率
**mealType** | 餐饮类型
**stopTimes** | 经停次数
**ticketsOfBusinessSold** | 商务舱机票售出数量
**ticketsOfEconomy** | 经济舱机票售出数量
**priceOfBusiness** | 商务舱机票价格
**priceOfEconomy** | 经济舱机票价格
**flightNumber** | 航班号
    

#  **airline**
列名 | 内容
------------ | -------------
**airlineCode** | 航空公司编号，主键
**airlineName** | 航空公司名称


#  **craft**
列名 | 内容
------------ | -------------
**craftTypeCode** | 飞机型号编号，主键
**craftKind** | 飞机体型
**craftTypeName** | 飞机型号名称
**seatsOfBusiness** | 商务舱座位数
**seatsOfEconomy** | 经济舱座位数


#  **airport**
列名 | 内容
------------ | -------------
**terminalId** | 航站楼编号，主键
**terminalName** | 航站楼名称
**airportCode** | 机场编号
**airportName** | 机场名称
**cityCode** | 城市编号，外键，关联到 city 的 cityCode 列


#  **city**
列名 | 内容
------------ | -------------
**cityCode** | 城市编号，主键
**cityName** | 城市名


#  **stop_info**
列名 | 内容
------------ | -------------
**flightId** | 每一次飞行的编号，主键，外键，关联到 flight 的 flightId 列
**startDate** | 开始日期
**endDate** | 结束日期
**cityCode** | 城市编号，外键，关联到 city 的 cityCode 列
**stopType** | 经停类型


#  **user**
列名 | 内容
------------ | -------------
**id** | 用户编号，主键
**username** | 用户名
**password** | 用户密码
**firstName** | 用户 first name
**lastName** | 用户 last name
**email** | 用户电子邮箱
**registerDate** | 用户注册日期时间
**age** | 用户年龄
**residentId** | 用户身份证号，唯一
**cash** | 用户余额


#  **orders**
列名 | 内容
------------ | -------------
**orderId** | 订单编号，主键
**userId** | 用户编号外键，关联到 user 的 id 列
**ticketNum** | 订票数量
**totalAmount** | 共计金额
**orderDate** | 订单日期时间
    

#  **tickets**
列名 | 内容
------------ | -------------
**id** | 机票编号，主键
**orderId** | 订单编号，外键，关联到 orders 的 orderId 列
**flightId** | 每一次飞行的编号，主键，外键，关联到 flight 的 flightId 列
**residentIdOfpassenger** | 乘客身份证号
**ticketType** | 机票类型（商务舱/经济舱）
**score** | 乘客评分
**feedback** | 乘客评价


#  **score**
列名 | 内容
------------ | -------------
**flightId** | 每一次飞行的编号，主键，外键，关联到 flight 的 flightId 列
**avgScore** | 平均评分
**scoreCount** | 评分数量

