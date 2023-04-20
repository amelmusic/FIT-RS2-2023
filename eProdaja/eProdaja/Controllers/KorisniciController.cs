using eProdaja.Model;
using eProdaja.Model.Requests;
using eProdaja.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KorisniciController : BaseCRUDController<Model.Korisnici, Model.SearchObjects.KorisniciSearchObject, Model.Requests.KorisniciInsertRequest, Model.Requests.KorisniciUpdateRequest>
    {
        public KorisniciController(ILogger<BaseController<Korisnici, Model.SearchObjects.KorisniciSearchObject>> logger, IKorisniciService service) : base(logger, service)
        {
            
        }

        [Authorize(Roles = "Administrator")]
        public override Task<Korisnici> Insert([FromBody] KorisniciInsertRequest insert)
        {
            return base.Insert(insert);
        }

    }
}
