package svsvsvsz;

public class adcasx {
public static void main(String[] args) {	
	int []a = {8,7,9,5,9,10,6,1,3};
	for(int i=0;i<a.length-1;i++) {
		for(int j=0;j<a.length-i-1;j++) {
			if(a[j]<a[j+1]) {
				int tem = 0;
				tem=a[j];
				a[j]=a[j+1];
				a[j+1]=tem;
			}
		}
	}
	for(int i=0;i<a.length;i++) {
		System.out.println(a[i]);
	}
	}
}
