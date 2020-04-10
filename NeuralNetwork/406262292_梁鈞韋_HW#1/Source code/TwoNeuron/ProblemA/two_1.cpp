#include<bits/stdc++.h>
using namespace std;

#define kase 12	// total 12 points = traning + testing
/*
	a = wp + b
	e = t - a
	w = w + e[p(Matrix Transposes)]
	b = b + e

	w = 2*2
	p = 2*1
	b = 2*1
	a = 2*1
	t = 2*1
	e = 2*1

	if ans not eqaul to {0 0}, {0 1}, {1 0}，{1 1}

	=> can't recognize
*/
int p[kase][2];
int e[8][2];
int a[12][2];
int t[8][2];
int w[2][2] = {	{1,0},
				{0,1}};
int b[2][1] = {	{1},{1}};

void hardlimit(int index)
{
	for(int i = 0 ; i < 2 ; i++)
	{
		a[index][i] = ( w[i][0]*p[index][0] + w[i][1]*p[index][1] ) + b[i][0];
		if(a[index][i] >= 0) a[index][i] = 1;
		else a[index][i] = 0;
	}
}

void training(int index)
{	
	for(int i = 0 ; i < 2 ; i++)
	{
		for(int j = 0 ; j < 2 ; j++)
		{
			w[i][j] += e[index][i] * p[index][j];
		}
	}
	for(int i = 0 ; i < 2 ; i++)
	{
		b[i][0] += e[index][i];
	}
}

void show()
{
	printf("Weight: \n");
	for(int i = 0 ; i < 2 ; i++)
	{
		printf("[%d] [%d]\n", w[i][0],w[i][1]);
	}
	printf("\n");
	printf("Bias : \n");
	for(int i = 0 ; i < 2 ; i++)
	{
		printf("[%d]\n",b[i][0]);
	}
}
int main()
{
	freopen("training_data.in","r",stdin);
	for(int i = 0 ; i < 8 ; i++) scanf("%d %d",&p[i][0],&p[i][1]);
	freopen("testing_data.in","r",stdin);
	for(int i = 8 ; i < kase ; i++) scanf("%d %d",&p[i][0],&p[i][1]);	
	freopen("target_value.in","r",stdin);
	for (int i = 0 ; i < 8 ; i++) scanf("%d %d",&t[i][0],&t[i][1]);
	freopen("output.out","w",stdout);
	
	int epoch = 0;
	bool flag = true;
	printf("First:\n\n");
	show();
	printf("-----------------------------\n");

	while(flag)
	{
		epoch++;
		flag = 0;
		for(int i = 0 ; i < 8 ; i++)
		{
			hardlimit(i);
			for(int j = 0 ; j < 2 ; j++)
			{
				e[i][j] = t[i][j] - a[i][j];
			}

			if(!((e[i][0] == 0) && (e[i][1] == 0)))
			{
				flag = 1;
				training(i);
			}		
		}
	}
	printf("Final:\n\n");
	printf("Epoch:%d\n\n",epoch);

	show();
	printf("-----------------------------\n");

	//testing
	for(int i = 8 ; i < kase ; i++)
	{
		printf("P%d: \n",i+1);
		hardlimit(i);
		for(int j = 0 ; j < 2 ; j++)
		{
			printf("[%d]\n",a[i][j]);
		}
		printf("\n");
	}
	return 0;
}