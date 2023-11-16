import matplotlib.pyplot as plt
def myroots(a,b,c):
a = c = 1
b = 10^8

# calculate the discriminant
d = (b**2) - (4*a*c)

# find two solutions
sol1 = (-b-math.sqrt(d))/(2*a)
sol2 = (-b+math.sqrt(d))/(2*a)

# using numpy.root
p = [a, b, c]
numpy.roots(p)

def myroots_acc(a,b,c):
a = c = 1
b = 10^8

# instead of using the quadratic equation, we can multiply and divide by the conjugate to get 
# rid of the catastrophic cancellation

#calculate new equation
sol1 = -2c/(b + math.sqrt(b**2 -4*a*c))
sol2 = -2c/(b - math.sqrt(b**2-4*a*c))

#6 
# def approx(x, h):
	# function f = exp(x)
	# inf = float('inf')
	# y1 = (f(x+h)-f(x))/h
	# y2 = (f(x+h)-f(x-h))/2*h
# for x in range (0,2,100):
	# y' = lim((f(x+h)-f(x))/h, h, inf)
	# plt.plot(x,y1,'ro')
	# plt.plot(x,y2)
	
# x = 0.5
# h = {10**-1,...,10**(-10)}
 # loglog(x, y1)
 # loglog(x, y2) 
