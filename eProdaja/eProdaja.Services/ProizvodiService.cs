using eProdaja.Model;
using eProdaja.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Services
{
    public class ProizvodiService : IProizvodiService
    {
        EProdajaContext _context;

        public ProizvodiService(EProdajaContext context)
        {
            _context = context;
        }

        List<Model.Proizvodi> proizvodis = new List<Model.Proizvodi>()
        {
            new Model.Proizvodi()
            {
                ProizvodId = 1,
                Naziv = "Laptop"
            }
        };

        public IList<Model.Proizvodi> Get()
        {
            //var list = _context.Proizvodis.ToList();

            return proizvodis;
        }
    }
}
