# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# class Employee
# 	#constructor: (name) ->
# 		#@name = name
# 		#console.log "Instantiated a new Employee object"#构造函数，实例化自动调用
# 	#constructor: (@name, @dob) ->#实例变量属性自动赋值
# 	constructor: (@attributes) ->

# 	#dob: (year = 1976, month = 7, day = 24) ->
# 		#new Date(year, month, day)

# 	printInfo: ->
# 		#console.log "name = #{@name}"
# 		#console.log "dob = #{@dob}"
# 		console.log "name = #{@attributes.name}, dob = #{@attributes.dob}"
# 		if @attributes.salary
# 			console.log "salary = #{@attributes.salary}"
# class Manager extends Employee
# 	bouns: ->
# 		@attributes.salary * .10

# 	printInfo: ->
# 		super
# 		console.log "bouns = #{@bouns()}"
#emp1 = new Employee("Chen", new Date())
# emp1 = new Employee
# 	name: "Mark"
# 	dob: new Date()
# 	#salary: "$100"
# emp1.printInfo()
#console.log emp1.name
#console.log emp1.dob()
#emp2 = new Employee("Dan")
#console.log emp2.name
#console.log emp2.dob(1979, 3, 28)
# manager = new Manager
# 	name: "Dan"
# 	dob: new Date(1979, 2, 23)
# 	salary: 10000
# manager.printInfo()

#类级函数：不需要实例化就可以调用函数，为函数提供了一种命名空间，例如Math.random()
#在类级函数中，尽量避免使用super
# class Employee
# 	constructor: -> Employee.hire(@)

# 	@hire: (employee) ->
# 		@allEmployees ||= []
# 		@allEmployees.push employee

# 	@total: ->
# 		console.log "There are #{@allEmployees.length} employees."
# 		@allEmployees.length
# new Employee()
# new Employee()
# new Employee()
# console.log Employee.total()

#原型函数：在Javascript中，要想在所有的对象实例上都添加函数或者属性，可以通过使用prototype属性将
#其添加到对象的原型上来实现。
#在Coffeescript中可以使用::操作符。
# myArray = [1..10]
# try
# 	console.log myArray.size()
# catch error
# 	console.log error
# Array::size = -> @length
# console.log myArray.size()

#异步：前面的代码没执行完，后面的已经开始执行了，回调函数，例如发送ajax请求
#同步：前面的代码一定要执行完，后面的才开始执行
#绑定->与=> P129


@sayHi = ->
	###
	text = "Add numbers: #{1 + 1}"
	console.log text

	text = "Call a function: #{escape "Hello World!"}"
	console.log text

	day = 'Tunday'
	console.log "It's a beautiful #{if day is 'Sunday' then day else 'Day'}"
	###

	#测试 内联注释

	###
	测试 块级注释
	###

	###
	console.log "+ 一元运算， 将字符串转换为数字：#{+'100'}"
	console.log "- 一元运算，取反：#{-50}"
	###

	###
	console.log "?= 判断是否存在， 不存在则赋值："
	y = null
	y ?= 3
	console.log y
	y ?= 100
	console.log y

	console.log "||= 判断条件为假则赋值："
	z = null
	z ||= 10
	console.log z
	z || = 100
	console.log z

	console.log "&&= 判断两者都为true则赋值："
	a = 1
	b = 2
	console.log a &&= b
	console.log a
	###

	#为避免引发bug, Coffeescript自动会将==和!=操作符转化为===和!==
	#console.log "== 完全相同：#{'a' == 'a'}"
	#console.log "!= 不完全相同：#{1 != 2}"

	###
	console.log "+ 拼接：#{'a' + 'b'}"
	x = "abc"
	x += "bbc"
	console.log "+= 拼接并赋值：#{x}"
	###

	#console.log x? #console.log(typeof x!== "undefined" && x!== null)
	#console.log someObject?.someFunction()

	###别名
	Coffeescript  Javascript
	is							===
	isnt						!==
	not							!
	and 						&&
	or 							||
	true, yes, on		true
	false, no, off	false
	@, this					this
	of     					in
	in 							N/A
	###
	###
	name = "mark"
	console.log name is "mark"
	console.log name isnt "bob"
	userExists = false
	if not userExists
		console.log "the user doesn't exist!"
	if true and true
		console.log "yes"
	if true or false
		console.log "yes1"
	answer = true
	console.log answer is true
	console.log answer is yes
	console.log answer is on
	answer = false
	console.log answer is false
	console.log answer is no
	console.log answer is off
	object = {
		name: 'mark'
		sayYes: ->
			console.log "Hello, #{@name}"
	}
	object.sayYes()
	console.log @name
	###

	#Coffeescript并不支持三元操作符
	#console.log if "Sunday" is "Sunday" then "Today is Sunday" else "Today is not Sunday"
	#unless "Monday" is "Sunday"#如果不是
		#console.log "No football today"
	#内联条件语句
	#console.log "Today is Sunday" if "Sunday" is "Sunday"
	#switch/case语句
	###
	switch "Monday"
		when "Saturday", "Tuesday"#用逗号分隔的值列表来匹配case关键字
			console.log "Here are your todos for the day ..."
		when "Sunday"
			console.log "Go watch football and relax"
		else
			console.log "Get to work you lazy bum!"
	###

	#函数
	#使用默认参数值时，很重要的一点就是它们必须要放在参数列表的最后。可以为多个参数设置默认参数值，但都必须要放在参数列表的最后。
	###
	default_tax_rate = 0.0625
	calculateTotal = (sub_total, rate = default_tax_rate) ->#rate = 0.0625 or rate = sub_total
		tax = sub_total * rate
		sub_total + tax
	val = 100
	console.log "What is the total of $#{val} worth of shopping?"
	console.log "The total is #{calculateTotal(val)}"#建议使用括号调用函数
	myFunction = () -> #在定义无参函数时，完全可以把括号去掉
		console.log "do some work here"
	myFunction1 = -> console.log "do some work here1"
	myFunction()
	myFunction1()
	###
	#有时定义函数时，我们不确定函数要接收多少个参数。Coffeescript允许在为函数定义参数列表时使用可选的splat操作符。
	#splat操作符是指在方法定义后的括号中使用...
	#splat操作符可以出现在参数列表的任意位置。不过，要注意的是，参数列表中只能有一个splat操作符。
	#splatter = (etc...) ->
		#console.log "Length: #{etc.length}, Values: #{etc.join(', ')}"
		#for element in etc
			#console.log "param = #{element}"
	#splatter()
	#splatter("a", "b", "c")
	#a = ["a", "b", "c"]
	#splatter(a...)


	#数组
	#myArray = ["a", "b", "c"]
	###
	myArray = [#不用逗号隔开
							"a"
							"b", "d", "f"
							"c"
						]
	#console.log myArray
	if "b" in myArray
		console.log "I found 'b'."
	unless "g" in myArray
		console.log "'g' was nowhere to be found."
	#交换赋值
	x = "X"
	y = "Y"
	[x, y] = [y, x]
	console.log "x = #{x}, y = #{y}"
	###
	#多重赋值
	#[a, b..., c, d, e] = [0, 1, 4, 2]
	#console.log "a = #{a}, b = #{b}, c = #{c}, d = #{d}, e = #{e}"
	#区间
	###
	myRange = [1..10]
	console.log myRange#1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	myRange = [1...10]
	console.log myRange#1, 2, 3, 4, 5, 6, 7, 8, 9
	myRange = [10..1]
	console.log myRange#10, 9, 8, 7, 6, 5, 4, 3, 2, 1
	myRange = [1..200]
	console.log myRange.join(", ")
	###
	#分割数组
	#myArray = [1..10]
	#first = myArray[0..2]#[0...3]
	#console.log first
	#first = myArray[4..7]
	#console.log first
	#替换数组值
	#myArray = [1..10]
	#myArray[4..7] = ['a', 'b', 'c', 'd']
	#console.log myArray
	#注入数值
	#myArray = [1..10]
	#myArray[4..-1] = ['a', 'b', 'c', 'd']
	#console.log myArray

	#对象/散列
	###
	obj = 
		firstName: "Mark"
		lastName: "Bates"
		fullName: ->
			"#{@firstName} #{@lastName}"
	obj.firstName = 'Chen'
	console.log obj.firstName
	obj['lastName'] = 'Dan'
	console.log obj['lastName']
	console.log obj.fullName()
	foo = 'FOO'
	bar = 'BAR'
	obj = {
		foo
		bar
	}
	console.log obj
	###

	#循环/迭代
	###
	myArray = [1..10]
	for i in myArray
		console.log "i = #{i}"

	#简洁代码
	console.log "i is #{i} aa" for i in myArray#单行代码块(comprehension)
	myArray1 = (i+10 for i in myArray)
	console.log myArray1#11, 12...20
	myArray2 = for i in myArray
		i+20
	console.log myArray2

	for i in myArray by 2#跳过一个
		console.log "i = #{i}"#1, 3, 5, 7, 9
	for i in myArray when i < 5
		console.log i#1, 2, 3, 4
	person = 
		fn: "Chen"
		sn: "Dan"
	for key, value of person
		console.log "#{key} is #{value}"
	#迭代对象不能使用by关键字
	for key, value of person when key isnt 'fn'
		console.log "#{key} = #{value}"
	
	#for own .. of .. P94
	#while/until
	times = (number_of_times, callback) ->
		index = 0
		until index++ >= number_of_times #while index++ < number_of_times
			callback(index)
		return null
	times 5, (index) ->
		console.log index
	###
	###
	#延迟打印循环
	#error
	for x in [1..5]
		setTimeout ->
			console.log x
		, 100 #6，6，6，6，6
	#right  do关键字会在要执行的代码外部创建一个包装函数，这样就能将访问的代码捕获住。
	for x in [1..5]
		do (x) ->
			setTimeout ->
				console.log x
			, 100#1，2，3，4，5
	###