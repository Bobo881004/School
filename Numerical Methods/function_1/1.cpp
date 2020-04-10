#include<bits/stdc++.h>
using namespace std;

#define error 10e-10
#define maxtime 1000
double a = -10.0;
double b = 2.0;
double c = 0.0,tmp_c=0.0;
int cnt;

double fun(double x)
{
	return exp(x) - 3.0*x*cos(2.0*x) - 8.3;
}	
double dfun(double x)
{
	return exp(x) - 3.0*cos(2.0*x) + 6.0*x*sin(2.0*x);
}
double FPMfun(double x)
{
	return (exp(x) - 8.3)/(3.0*cos(2.0*x));//log(3*x*cos(2*x) + 8.3); 
}
void Bisection(double a, double b)
{
	double A = a, B = b;
	int cnt = 0;
	if(fun(a) * fun(b) >= 0)	return;

	while(fabs(a-b) > (2.0 * error))
	{	
		cnt++;
		c = (a + b) / 2.0;
		if(fun(a) * fun(c) > 0 )
			a = c;
		else
			b = c;
	}
	printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
	c = 0;
}
void FalsePosition(double a, double b)
{
	double X, A = a, B = b;
	int cnt = 0;
	if(fun(a) * fun(b) >= 0)	return;
	
	while(fabs(X-c) >= error)
	{
		cnt++;
		c = (a*fun(b) - b*fun(a)) / (fun(b)- fun(a));
		if(fun(a) * fun(c) < 0)
			b = c;
		else 
			a = c;
		X = (a*fun(b) - b*fun(a)) / (fun(b)- fun(a));
	}
	printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
	c = 0;
}
void ModifyFalsePosition(double a, double b)
{
	double X = 1, A = a, B = b;
	double FA = fun(a);
	double FB = fun(b);
	int cnt = 0;
	if(FA * FB >= 0)	return;

	while(fabs(X-c) >= error )
	{
		cnt++;
		c = (a*FB - b*FA) / (FB - FA);
		if(FA * fun(c) < 0)
		{
			b = c;
			FA /= 2.0;
		}
		else
		{
			a = c;
			FB /= 2.0;
		}	
		X = (a*FB - b*FA) / (FB - FA);
	}
	printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
	c = 0;
}
void Secant(double a, double b)
{
	double A = a, B = b;
	int cnt = 0;
	while(cnt < maxtime)
	{	
		cnt++;
		c = (a*fun(b) - b*fun(a)) / (fun(b) - fun(a));
		a = b;
		b = c;
		if((fabs(b - a) < error) && (A <= c && c <= B))
		{
			printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
			c = 0;
			return;
		}
	}	
}
void Newton(double a, double b)
{
	double A = a, B = b, c = a;
	double delta;
	int cnt = 0;
	while(cnt < maxtime )
	{
		cnt++;
		delta = -(fun(c)) / (dfun(c));
		c += delta;
		if((fabs(delta) < error) && (A <= c && c <= B))
		{
			printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
			c = 0;
			return;
		}	
	}
}
void FixedPoint(double a, double b)
{
	double A = a, B = b;
	double Xold = a;
	double c = FPMfun(Xold);
	int cnt = 0;
	//printf("%.23lf ,%.23lf\n", Xold,c);
	while((fun(c) >= error) && (cnt < maxtime) )
	{
		cnt++;
		Xold = c;
		c = FPMfun(Xold);
		//printf("Xold = %.23lf , c = %.23lf\n", Xold,c);
	}
	if(A <= c && c <= B)
	printf("%d Times. Between %.1lf AND %.1lf have the answer: %.23lf\n",cnt,A,B,c);
	return;
}
int main(int argc, char const *argv[])
{

	freopen("output.txt","w",stdout);
	printf("Between %.1lf AND %.1lf\n\n", a,b);
	printf("Bisection Method:\n\n");
	for (float i = a; i < b; i++)
	{
		Bisection(i,i+1);
	}
	printf("_____________________\n\n");
	printf("FalsePosition Method:\n\n");
	for (float i = a; i < b; i++)
	{
		FalsePosition(i,i+1);
	}
	printf("_____________________\n\n");
	printf("ModifyFalsePosition Method:\n\n");
	for (float i = a; i < b; i++)
	{
		ModifyFalsePosition(i,i+1);
	}
	printf("_____________________\n\n");
	printf("Secant Method:\n\n");
	for (float i = a; i < b; i++)
	{
		Secant(i,i+1);
	}
	printf("_____________________\n\n");
	printf("Newton Method:\n\n");
	for (float i = a; i < b; i++)
	{
		Newton(i,i+1);
	}
	printf("_____________________\n\n");
	printf("Fixed Point Method:\n\n");
	for (float i = a; i < b; i++)
	{
		FixedPoint(i,i+1);
	}
	return 0;
}
