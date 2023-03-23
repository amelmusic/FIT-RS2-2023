using eProdaja.Model;
using eProdaja.Services;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProizvodiController : ControllerBase
    {
        private readonly IProizvodiService _proizvodiService;
        private readonly ILogger<ProizvodiController> _logger;

        public ProizvodiController(ILogger<ProizvodiController> logger, IProizvodiService proizvodiService)
        {
            _logger = logger;
            _proizvodiService = proizvodiService;
        }

        [HttpGet()]
        public IEnumerable<Proizvodi> Get()
        {
            return _proizvodiService.Get();
        }
    }
}