public class Assert {
    Integer a;
    Integer b;
    public Assert(Integer a, Integer b){
        this.a=a;
        this.b=b;
    }
    public void Test(){
        System.Assert(this.a==this.b,'a is not equal to b');
    }
}