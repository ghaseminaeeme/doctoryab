using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace DoctorYab
{
    public class SchemaModels
    {
    }

    public class PhysicianSchema
    {
        public string context { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string telephone { get; set; }
        public string email { get; set; }
        public string url { get; set; }
        public string image { get; set; }
        public string medicalSpecialty { get; set; }

        public AddressSchema address { get; set; }
        public GeoSchema geo { get; set; }

        public List<string> sameAs { get; set; }
    }


    public class AddressSchema
    {
        public string type { get; set; }
        public string addressLocality { get; set; }
        public string streetAddress { get; set; }
    }


    public class GeoSchema
    {
        public string type { get; set; }
        public string latitude { get; set; }
        public string longitude { get; set; }
    }


    public class BreadcrumbSchema
    {
        public string context { get; set; }
        public string type { get; set; }

        public List<BreadcrumbItem> itemListElement { get; set; }
    }


    public class BreadcrumbItem
    {
        public string type { get; set; }
        public int position { get; set; }
        public string name { get; set; }
        public string item { get; set; }
    }
}