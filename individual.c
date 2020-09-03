#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

        int pin, id, salary,newbal;
        char fname;


        int createaccount(){
                char lname,gender;

                printf("Enter first name: \n");
                scanf("%s",&fname);

                printf("Enter last name: \n");
                scanf("%s",&lname);

                printf("Enter ID number: \n");
                scanf("%d",&id);

                printf("Is your gender male of female? \n");
                scanf("%s",&gender);

                printf("Enter your salary : \n");
                scanf("%d",&salary);

                printf("Enter your PIN number: \n");
                scanf("%d",&pin);

                int c,n;
                n= rand()%100+1;
                printf("Your automatically generated account number is %d\n",n);
                main();
                return 0;
        }

int deposit(x,y){
        int bal=0;
        int confid, confpin,pinn,idd;
a:
        printf("Enter your ID number\n ");
        scanf("%d",&confid);

        printf("Enter your PIN: \n");
        scanf("%d",&confpin);

        if(confid!=x){
                printf("Invalid ID\n");
                goto a;
        }
        if(confpin!=y){
                printf("Invalid PIN \n");
                goto a;
        }
        else{
                printf("Enter the amount you wish to deposit: \n");
                int depo;
                scanf("%d",&depo);
                newbal=bal+depo;
                printf("The new balance is now: %d\n",newbal);
                printf("Press any key to exit");
                main();
        }
        return 0;
}

int withdraw(int x, int y, int *z){
        int pinn, idd;
loop:
        printf("Enter yout ID: \n");
        scanf("%d",&idd);
        printf("Enter your PIN: \n");
        scanf("%d",&pinn);

        if(idd!=x){
                printf("Invalid ID \n");
                goto loop;
        }
        if(pinn!=y){
                printf("Invalid PIN \n");
                goto loop;
        }
        else
                j:
                printf("Enter the amount you wish to withdraw: \n");
        int amount;
        scanf("%d",&amount);
        if(amount>*z){
                printf("Insufficient funds.Try again. Your balance is:%d \n",newbal);
                goto j;
        }
        else{
                *z=*z-amount;
                printf("Your withdrawal was successful. Balance is:%d \n",*z);
                printf("Newbal value is %d \n ",newbal);
                printf("Press any key to continue");
                main();
        }
        return *z;
}

int checkbalance(int a,int b, int *c){
        int pinn, idd;
b:
           printf("Enter yout ID: \n");
           scanf("%d",&idd);
           printf("Enter your PIN: \n");
           scanf("%d",&pinn);
                 if(idd!=a){
                         printf("Invalid ID \n");
                          goto b;
                 }
                 if(pinn!=b){
                         printf("Invalid PIN \n");
                         goto b;                                                                        }
                 else{
                         printf("Your account balance is %d\n",*c);
                         main();
                 }
                         return 0;
}

int main(){
major:
        printf("\tWELCOME TO THE BANK\n");
        printf("\tWhat would you like to do today?\n");
        printf("\t1.CREATE AN ACCOUNT");
        printf("\t2.DEPOSIT MONEY\n");
        printf("\t3.WITHDRAW MONEY\n");
        printf("\t4.CHECK BALANCE\n");
        int read;
        scanf("%d",&read);
	if(fork()==0){
        switch(read){
        case 1:
	if(fork()==0){
                createaccount(id,pin);
	}
        break;
        case 2:
		if(fork()==0){
                deposit(id,pin);
		}
        break;
        case 3:
		if(fork()==0){
                withdraw(id,pin,&newbal);
			}
        break;
        case 4:
		if(fork()==0){	
                checkbalance(id,pin,&newbal);

			}
        break;
        default:
                printf("Invalid chopice \n");
                goto major;
        }
        return 0;
}

}
