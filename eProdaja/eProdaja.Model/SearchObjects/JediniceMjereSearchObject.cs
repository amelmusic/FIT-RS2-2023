using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Model.SearchObjects
{
    public class JediniceMjereSearchObject : BaseSearchObject
    {
        public string? Naziv { get; set; }
        public string? FTS { get; set; }
    }
}
