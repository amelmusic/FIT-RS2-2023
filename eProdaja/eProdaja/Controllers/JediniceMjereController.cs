using eProdaja.Model;
using eProdaja.Model.Requests;
using eProdaja.Services;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.Controllers
{
    [ApiController]
    public class JediniceMjereController : BaseController<Model.JediniceMjere, Model.SearchObjects.JediniceMjereSearchObject>
    {
        public JediniceMjereController(ILogger<BaseController<JediniceMjere, Model.SearchObjects.JediniceMjereSearchObject>> logger, IJediniceMjereService service) : base(logger, service)
        {
        }
    }
}
