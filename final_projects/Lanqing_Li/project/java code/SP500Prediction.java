import java.io.*;
import java.util.Scanner;

public class SP500Prediction {
	public static void main(String args[]) throws IOException{
		double []price=new double[754];// stock prices for 3 years(11-13), length=754
		double []logReturn=new double[753]; //log returns for 3 years(11-13), length=7531
		double []x1=new double[252]; // stock prices in increasing dates
		double []x2=new double[250];
		double []x3=new double[252];
		double []r1=new double[251]; // returns in increasing dates
		double []r2=new double[250];
		double []r3=new double[252];
		double []r21=new double[250];
		double []r22=new double[250];
		double []r23=new double[250];
		String file1="sp500_price.csv";
		String file2="sp500_return.csv";
		File myFile1 = new File(file1);//read in time t(daily)
		Scanner inputFile1 = new Scanner(myFile1);
		File myFile2 = new File(file2);
		Scanner inputFile2 = new Scanner(myFile2);
		FileWriter fwriter=new FileWriter("output1.txt",true);//output the prediction values into this file
		PrintWriter output1=new PrintWriter(fwriter);
		FileWriter fwriter1=new FileWriter("return.txt",true);
		PrintWriter logRe =new PrintWriter(fwriter1);
		FileWriter fwriter2=new FileWriter("orignalreturn.txt",true);
		PrintWriter logRE= new PrintWriter(fwriter2);
		FileWriter fwriter3=new FileWriter("orignalprice.txt",true);
		PrintWriter orignalprice= new PrintWriter(fwriter3);
		int c1=0;
		while(inputFile1.hasNext()){
			double number=inputFile1.nextDouble();
			price[c1]=number;
			orignalprice.println(price[c1]);
			//System.out.println(price[c1]);
			c1++;
		}
		inputFile1.close();
		orignalprice.close();
		int c2=0;
		while(inputFile2.hasNext()){
			double number=inputFile2.nextDouble();
			logReturn[c2]=number;
			logRE.println(logReturn[c2]);
			c2++;
		}
		inputFile2.close();
		logRE.close();//orignal return order(decreasing)
		for(int i=0; i<=251;i++){
			x1[i]=price[753-i];
		}
		for(int i=0;i<=249;i++){
			x2[i]=price[501-i];
		}
		for(int i=0;i<=251;i++){
			x3[i]=price[251-i];
		}
		for(int i=0; i<=250;i++){
			r1[i]=logReturn[752-i];
			logRe.println(r1[i]);
			//System.out.println(r1[i]);
		}
		//logRe.println("r1r1r1r1r1r1r1r1r1r");
		for(int i=0;i<=249;i++){
			r2[i]=logReturn[501-i];
			logRe.println(r2[i]);
		}
		//logRe.println("r2r2r2r2r2r2r2r2r2r2r2r");
		for(int i=0;i<=251;i++){
			r3[i]=logReturn[251-i];
			logRe.println(r3[i]);
		}
		//logRe.println("r3r3r3r3r3r3r3r3r3r3r3r");
		logRe.close();
		for(int i=0;i<=249-60;i++){
			r21[i]=r2[60+i];
		}
		for(int i=249-59;i<=249;i++){
			r21[i]=r3[i-190];
		}
		for(int i=0;i<=249-60-64;i++){
			r22[i]=r2[60+64+i];
		}
		for(int i=249-59-64;i<=249;i++){ //i=126(initial)
			r22[i]=r3[i-126];
		}
		for(int i=0;i<=249-60-64-64;i++){
			r23[i]=r2[60+64+64+i];
		}
		for(int i=249-59-64-64;i<=249;i++){ //i=62(initial)
			r23[i]=r3[i-62];
		}
		double miu1=computemean(r2);
		double sigma1=computeSD(r2);
		System.out.println(miu1);
		System.out.println(sigma1);
		double miu2=computemean(r21);
		double sigma2=computeSD(r21);
		System.out.println(miu2);
		System.out.println(sigma2);
		double miu3=computemean(r22);
		double sigma3=computeSD(r22);
		System.out.println(miu3);
		System.out.println(sigma3);
		double miu4=computemean(r23);
		double sigma4=computeSD(r23);
		System.out.println(miu4);
		System.out.println(sigma4);
		int h1=60;
		int h2=64;
		int h3=64;
		int h4=62;
		double []pre1=new double[h1+1];
		double []pre2=new double[h2+1];
		double []pre3=new double[h3+1];
		double []pre4=new double[h4+1];
		double [][]pred=new double[1000][4];
		double []prediction=new double[4];
		pre1=gbm(x3[0],miu1,sigma1,h1+1);
		for(int i=0;i<h1+1;i++){
			output1.println(pre1[i]);
			//System.out.println(pre1[i]);
		}
		output1.close();
		double sum=0;
		for(int k=0;k<1000;k++){
			pre1=gbm(x3[0],miu1,sigma1,h1+1);
			pre2=gbm(x3[60],miu1,sigma1,h2+1);
			pre3=gbm(x3[124],miu1,sigma1,h2+1);
			pre4=gbm(x3[188],miu1,sigma1,h3+1);
			pred[k][0]=pre1[h1];
			pred[k][1]=pre2[h2];
			pred[k][2]=pre3[h3];
			pred[k][3]=pre4[h4];
		}
		prediction[0]=computemean(pre1);
		prediction[1]=computemean(pre2);
		prediction[2]=computemean(pre3);
		prediction[3]=computemean(pre4);
		System.out.println(x3[0]+", predictior");
		System.out.println(prediction[0]);
		System.out.println(x3[60]+", predictior");
		System.out.println(prediction[1]);
		System.out.println(x3[124]+", predictior");
		System.out.println(prediction[2]);
		System.out.println(x3[188]+", predictior");
		System.out.println(prediction[3]);
	}
	public static double []gbm(double origin,double mu,double vol,int h){
		double []pre=new double[h];
		double sigma=vol*Math.sqrt(h);
		double miu=mu*h+0.5*sigma*sigma;
		double n=h;
		double dt=1/n;
		pre[0]=origin;
		//pre[0]=origin*Math.exp((miu-0.5*sigma*sigma)*dt+sigma*Math.sqrt(dt)*normgenerator());
		for(int i=1;i<n;i++){
			//sigma=sig+Math.sqrt(0.0004539)*normgenerator();
			pre[i]=pre[i-1]*Math.exp((miu-0.5*sigma*sigma)*dt+sigma*Math.sqrt(dt)*normgenerator());
			//sig=sigma;
		}
		return pre;
	}
	
	public static double computemean(double x[]){ // get mean of returns
		double sum=0;
		for(int i=0;i<x.length;i++){
			sum=sum+x[i];
		}
		return sum/x.length;
	}
	
	public static double computeSD(double x[]){ // get sd of returns
		double sum=0;
		double mean;
		double []diff=new double[x.length];
		double sumSq=0;
		double sumDiff=0;
		for(int i=0;i<x.length;i++){
			sum=sum+x[i];
		}
		mean=sum/x.length;
		for(int i=0;i<x.length;i++){
			diff[i]=(x[i]-mean)*(x[i]-mean);
		}
		for(int i=0;i<x.length;i++){
			sumDiff=sumDiff+diff[i];
		}
		return Math.sqrt(sumDiff/(x.length-1));
	}
	
	public static double normgenerator(){//generate z following normal distribution
		double norm=0;
		double []rand=new double[12];//total random process.
		for(int i=0;i<12;i++){
			rand[i]=Math.random();
			norm=norm+rand[i];
		}
		norm=norm-6;
		return norm;
	}
}
