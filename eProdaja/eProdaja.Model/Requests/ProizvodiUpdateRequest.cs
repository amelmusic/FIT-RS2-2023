using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Model.Requests
{
    public class ProizvodiUpdateRequest
    {
        public string Naziv { get; set; }
        public decimal? Cijena { get; set; }
        public int? JedinicaMjereId { get; set; }
        public byte[]? Slika { get; set; }
        public byte[]? SlikaThumb { get; set; }

    }
}
