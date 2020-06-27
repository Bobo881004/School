import numpy as np
import matplotlib.pyplot as plt
import math

data_x = [  0.00, 0.20, 0.48, 0.61, 0.80, 1.01, 1.12, 1.27, 1.48, 1.72, 
            1.97, 2.25, 2.52, 2.78, 2.94, 3.25, 3.39, 3.71, 4.02, 4.13, 
            4.24, 4.33, 4.64, 4.87, 5.06, 5.17, 5.44, 5.53, 5.77, 5.88,
            6.19, 6.42, 6.70, 6.91, 7.17, 7.34, 7.49, 7.60, 7.92, 8.15,
            8.41, 8.61, 8.73, 9.00, 9.20]

data_y = [  1.0000, 1.2482, 1.7019, 1.8899, 2.0800, 2.1157, 2.0514, 1.8839, 1.5201, 1.0361,
        0.6630, 0.5458, 0.7697, 1.1515, 1.4096, 1.7564, 1.8162, 1.7406, 1.5357, 1.4631,
        1.4105, 1.3752, 1.3337, 1.3300, 1.3022, 1.2625, 1.1111, 1.0496, 0.8930, 0.8547,
        0.9213, 1.1665, 1.5988, 1.9059, 2.1186, 2.0953, 1.9652, 1.8140, 1.1951, 0.7906,
        0.5518, 0.5768, 0.6775, 1.0472, 1.3796]

def least_square():
    error = []
    for n in range(2,50):    
        A = np.zeros(n*n).reshape(n,n) 
        b = np.zeros(n)
        total = len(data_x)        
        ans = []
        
        #calculate A
        for i in range(n):
            for j in range(n):
                for k in range(total):
                    A[i,j] += pow(data_x[k], i+j);
        
        #calculate b
        for i in range(n):
            for j in range(total):
                b[i] += data_y[j] * pow(data_x[j], i)
        
        #calculate Ax = b
        x = np.linalg.solve(A,b)

        #p(x) = a1 + a2x + a3x^2 + .... + anx^n
        for i in range(total):
            tmp = 0
            for j in range(n):
                tmp += x[j] * pow(data_x[i], j)
            ans.append(tmp)

        #calculate error
        E = 0
        for i in range(total):
            E += pow(ans[i] - data_y[i], 2)
        if(total-n <= 0):
            error.append(99999999999999)
        else: 
            er = np.sqrt(E/(total-n))
            error.append(er)

        #draw the picture
        plt.cla()
        plt.clf()
        plt.title("Least_Square. Degree is "+ str(n-1))
        plt.xlabel("x_label")        
        plt.ylabel("y_label")
        plt.plot(data_x,data_y,'b:',label='f(x)')
        plt.plot(data_x,ans,'r:',label='p(x)')
        plt.savefig("./picture/P" + str(n-1) + "(x).png")
    
    #find the best choise
    best = 0    
    for i in range(len(error)):
        if(error[i] < error[best]):
            best = i 
    print("the best choice is the degree is" ,best+1, end='\n')
    print("the picture P", best+1,"(x) is the best.")

def main():
    least_square()

if __name__ == "__main__":
    main()