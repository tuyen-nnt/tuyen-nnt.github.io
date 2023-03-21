
Set là dấu () không index, không đổi giá trị
List là dấu {} có index có đổi giá trị
Tuples {} có index không đổi giá trị
Dictionary & nested dict dấu {} => truy cập dict[]

### Lambda function
The power of lambda is better shown when you use them as an anonymous function inside another function.

Say you have a function definition that takes one argument, and that argument will be multiplied with an unknown number. Use that function definition to make a function that always doubles the number you send in:

def myfunc(n):
  return lambda a : a * n

mytripler = myfunc(3)

print(mytripler(11))
