import numpy as np
import time 

N = [2,3,4,10,50,100,500,1000]

for n in N:
    print("n = %d" %n)
    A = np.random.rand(n,n)
    B = np.random.rand(n,1)

    Begin = time.time()
    ans = np.linalg.solve(A,B)
    End = time.time()


    print("time : %.19f " % (End - Begin))
    if n < 5: #you can change this to see the answer [10,50,100,500,1000]
        for i in range(n):
            for j in range(n):
                print("%lf{X%d} " %(A[i][j],j)  ,end="")
                if j != (n-1):
                    print("+ ",end="")
            print("= %lf" %(B[i][0]) ,end="")
            print("\n")
        for i in range(n):
            print("X%d = %lf, " %(i,ans[i][0]) ,end="")
        print("\n")
    print("-------------------")