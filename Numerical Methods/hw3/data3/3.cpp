#include<bits/stdc++.h>
using namespace std;

#define n 20
double low = -3, high = -1;//range -1 ~ 1
double x[n], y[n][n];
double g_table[n][n];

void dividedDifference_table()
{
    int tmp = n-1;
    for(int i = 1; i < n; i++)
    {
        for(int j = 0; j < tmp; j++)
            y[i][j] =(y[i-1][j+1] - y[i-1][j]) / (x[j+i] - x[j]);
        tmp -= 1;
    }
}
void newten_formula(double num)
{
    double coeff[n];//coefficient
    double ans = 0.0, tmp = 0.0;
    for(int i = 0; i < n-1; i++)
        coeff[i] = num - x[i];
    for(int i = 0; i < n; i++)
    {
        tmp = y[i][0];
        for(int j = 0; j < i; j++)
        {
            tmp *= coeff[j];
        }
        ans += tmp;
    }
    printf("X = %lf, F(X) = %lf\n",num,ans);
}
void largrange_formula(double num)
{
    double ans = 0.0, fraction = 1.0, denominator = 1.0; // (fraction/denominator) e.g: 3/2 = 1.5
    for(int i  = 0; i < n; i++)
    {
        fraction = y[0][i];
        denominator = 1.0;
        for(int j = 0; j < n; j++)
        {
            if(j == i)  continue;
            fraction *= (num - x[j]);
            denominator *= (x[i] - x[j]);
        }
        ans += fraction/denominator;
    }
    printf("X = %lf, F(X) = %lf\n",num,ans);
}
void gregory_table()
{
    int tmp = n-1;
    for(int i = 0; i < n; i++)
        g_table[0][i] = y[0][i];
    for(int i = 1; i < n; i++)
    {
        for(int j = 0; j < tmp; j++)
            g_table[i][j] = g_table[i-1][j+1] - g_table[i-1][j];
        tmp -= 1;
    }
}
double cal(double num, int count) 
{ 
    double tmp = num;
    if(count == 1)  return 1;
    for (int i = 1; i < count; i++) 
        tmp = tmp * (num - i); 
    return tmp; 
} 
double fact(int count) 
{ 
    double tmp = 1; 
    for(int i = 2; i <= count; i++) 
        tmp *= i; 
    return tmp; 
} 
void forward_formula(double num)
{
    double ans = 0.0, tmp = 0.0;
    double S = (num - x[0]) / (x[1] - x[0]);

    for(int i = 0; i < n; i++)
    {
        tmp = g_table[i][0];
        if(i != 0)
        {
            tmp *= (cal(S,i)/ fact(i));
        }
            
        ans += tmp;
    }
    printf("X = %lf F(X) = %lf\n",num,ans);
}
void backward_formula(double num)
{
    double ans = 0.0, tmp = 0.0;
    double S = (num - x[n-1]) / (x[1] - x[0]);

    for(int i = 0; i < n; i++)
    {
        tmp = g_table[i][n-1-i];
        if(i != 0)
            tmp *= (cal(S+i-1,i)/ fact(i));
        ans += tmp;
    }
    printf("X = %lf F(X) = %lf\n",num,ans);
}

int main()
{
    freopen("data3.txt","r",stdin);
    freopen("output.txt","w",stdout);
    for(int i = 0; i < n; i++)
        scanf("%lf %lf",&x[i],&y[0][i]);

    printf("By Newten's Divided Difference method:\n");
    dividedDifference_table();
    for(double i = low; i < high; i += 0.001)
        newten_formula(i);
    printf("\n");
    
    printf("By Lagrange Polynomial method:\n");
    for(double i = low; i < high; i += 0.001)
        largrange_formula(i);
    printf("\n");

    printf("By Gregory-Newton Forward Difference method:\n");
    gregory_table();
    for(double i = low; i < high; i += 0.001)
        forward_formula(i);
    printf("\n");
    
    printf("By Gregory-Newton backward Difference method:\n");
    for(double i = low; i < high; i += 0.001)
        backward_formula(i);
    printf("\n");
    
    return 0;
}