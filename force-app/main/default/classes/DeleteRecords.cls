public class DeleteRecords {
    public static void Xoa(){
        List <Opportunity> list_opp = [Select ID, name, StageName from Opportunity where Name like '%Test Opp%'];
        delete list_opp;
    }
}