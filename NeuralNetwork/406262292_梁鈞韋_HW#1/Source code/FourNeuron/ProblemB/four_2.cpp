#include<bits/stdc++.h>
using namespace std;

#define kase 1040	// total 1040 points = traning + testing
#define trainingN 1000
#define testingN 40
#define property 2
#define neurons 4
#define learningRate 1
/*
	a = wp + b
	e = t - a
	w = w + e[p(Matrix Transposes)]
	b = b + e

	w = 4*2
	p = 3*1
	b = 4*1
	a = 4*1
	t = 4*1
	e = 4*1

	Watermalon = {1 0 0 0}
	Banana = {0 1 0 0}
	Pineapple = {0 0 1 0}
	Orange = {0 0 0 1}

	if ans not eqaul to {0 0 0 1}, {0 0 0 1}, {0 1 0 0}，{1 0 0 0}
	=> can't recognize  
	=> output will be '?'
*/
double p[kase][property];
double e[trainingN][neurons]; 
double a[kase][neurons];
double t[trainingN][neurons];
double w[neurons][property];
double b[neurons][1];


double fRand(double fMin, double fMax)
{
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}

void setup()
{
    for(int i = 0 ; i < neurons ; i++)
    {
        for(int j = 0 ; j < property ; j++)
        {
            w[i][j] = fRand(-10, 10);
        }
    }//setup W
    for(int i = 0 ; i < neurons ; i++)
    {
    	b[i][0] = fRand(-10, 10);
	}//setup B
}

char kind_of_fruit(int index)
{
	if((a[index][0] == 1) && (a[index][1] == 0) && (a[index][2] == 0) && (a[index][3] == 0))
		return 'W';
	if((a[index][0] == 0) && (a[index][1] == 1) && (a[index][2] == 0) && (a[index][3] == 0))
		return 'B';
	if((a[index][0] == 0) && (a[index][1] == 0) && (a[index][2] == 1) && (a[index][3] == 0))
		return 'P';
	if((a[index][0] == 0) && (a[index][1] == 0) && (a[index][2] == 0) && (a[index][3] == 1))
		return 'O';
	else
		return '?' ;
}

void set_T(int index , char c)
{

	if(c == 'W')
	{
		t[index][0] = 1;
		t[index][1] = 0;
		t[index][2] = 0;
		t[index][3] = 0;
	}
	else if(c == 'B')
	{
		t[index][0] = 0;
		t[index][1] = 1;
		t[index][2] = 0;
		t[index][3] = 0;
	}
	else if(c == 'P')
	{
		t[index][0] = 0;
		t[index][1] = 0;
		t[index][2] = 1;
		t[index][3] = 0;
	}
	else if(c == 'O')
	{
		t[index][0] = 0;
		t[index][1] = 0;
		t[index][2] = 0;
		t[index][3] = 1;
	}
	return;
}

void hardlimit(int index)
{
	for(int i = 0 ; i < neurons ; i++)
	{
		a[index][i] = ( w[i][0]*p[index][0] + w[i][1]*p[index][1] ) + b[i][0];
		if(a[index][i] >= 0) a[index][i] = 1;
		else a[index][i] = 0;
	}
}

void training(int index)
{	
	for(int i = 0 ; i < neurons ; i++)
	{
		for(int j = 0 ; j < property ; j++)
		{
			w[i][j] += learningRate * e[index][i] * p[index][j];
		}
	}
	for(int i = 0 ; i < neurons ; i++)
	{
		b[i][0] += learningRate * e[index][i];
	}
}

void show()
{
	printf("Weight: \n");
	for(int i = 0 ; i < neurons ; i++)
	{
		printf("[%lf] [%lf]\n", w[i][0],w[i][1]);
	}
	printf("\n");
	printf("Bias : \n");
	for(int i = 0 ; i < neurons ; i++)
	{
		printf("[%lf]\n",b[i][0]);
	}
}
int main()
{
	srand(time(NULL)); // 使每一次執行所產生的亂數皆不同
	double trashdata;
	char fruit;
	freopen("training_data.txt","r",stdin);
	for(int i = 0 ; i < trainingN ; i++)
	{
		scanf("%lf %lf %lf %c",&p[i][0],&p[i][1],&trashdata,&fruit);
		set_T(i,fruit);
	}

	freopen("testing_data.txt","r",stdin);
	for(int i = trainingN ; i < kase ; i++)scanf("%lf %lf %lf",&p[i][0],&p[i][1],&trashdata);
	freopen("output.out","w",stdout);
	

	int epoch = 0;
	bool flag = true;
	setup();
	printf("First:\n\n");
	show();
	printf("-----------------------------\n");

	while(flag)
	{
		epoch++;
		flag = 0;
		for(int i = 0 ; i < trainingN ; i++)
		{
			hardlimit(i);
			for(int j = 0 ; j < neurons ; j++)
			{
				e[i][j] = t[i][j] - a[i][j];
			}

			if(!( (e[i][0] == 0) && (e[i][1] == 0) && (e[i][2] == 0) && (e[i][3] == 0) ))
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
	for(int i = trainingN ; i < kase ; i++)
	{
		printf("%d: ",i+1-1000);
		hardlimit(i);
		printf("%c",kind_of_fruit(i));
		printf("\n");
	}
	return 0;
}