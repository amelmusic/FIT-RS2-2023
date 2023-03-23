using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Model
{
    public partial class VrsteProizvodum
    {
        public int VrstaId { get; set; }

        public string Naziv { get; set; } = null!;
    }
}
