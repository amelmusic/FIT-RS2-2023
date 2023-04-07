using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Model.Requests
{
    public class ProizvodiInsertRequest
    {
        [Required(AllowEmptyStrings = false)]
        public string Naziv { get; set; }
        
        [Required(AllowEmptyStrings = false, ErrorMessage = "Sifra je obavezna")]
        [MinLength(1)]
        [MaxLength(10)]
        public string Sifra { get; set; }

        [Required]
        [Range(0, 10000)]
        public decimal? Cijena { get; set; }
        public int? VrstaId { get; set; }
        public int? JedinicaMjereId { get; set; }
        public byte[]? Slika { get; set; }
        public byte[]? SlikaThumb { get; set; }

    }
}
