namespace BillingSoftware.Model
{
    public class ResponseModel
    {
        public int recordid { get; set; }
        public string status { get; set; }

        public string Errormessg { get; set; }
    }

    public class EnquiryResponseModel
    {

        public string recordid { get; set; }
        public string status { get; set; }

        public string Errormessg { get; set; }
    }
}
