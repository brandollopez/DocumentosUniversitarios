int main(){
    int cal;
    printf("introduzca una calificacion:");
    scanf("%d", &cal);
    if(cal >=90){
        printf("A\n");
    } else if (cal >=80){
        printf("B\n");
    }else if (cal >=70){
        printf("C\n");
    }else if (cal >=60){
        printf("D\n");
    }else{
        printf("F\n");
    }
    system("pause");
}
