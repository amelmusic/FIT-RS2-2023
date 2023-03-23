using eProdaja.Model.SearchObjects;
using eProdaja.Services;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.Controllers
{
    [ApiController]
    public class VrsteProizvodumController : BaseController<Model.VrsteProizvodum, BaseSearchObject>
    {
        public VrsteProizvodumController(ILogger<BaseController<Model.VrsteProizvodum, BaseSearchObject>> logger
            , IService<Model.VrsteProizvodum, BaseSearchObject> service) : base(logger, service)
        {
        }
    }
}
