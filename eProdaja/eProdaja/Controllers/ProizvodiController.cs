﻿using eProdaja.Model;
using eProdaja.Model.Requests;
using eProdaja.Services;
using Microsoft.AspNetCore.Mvc;

namespace eProdaja.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProizvodiController : BaseCRUDController<Model.Proizvodi, Model.SearchObjects.ProizvodiSearchObject, Model.Requests.ProizvodiInsertRequest, Model.Requests.ProizvodiUpdateRequest>
    {
        public ProizvodiController(ILogger<BaseController<Proizvodi, Model.SearchObjects.ProizvodiSearchObject>> logger, IProizvodiService service) : base(logger, service)
        {
            
        }


        [HttpPut("{id}/activate")]
        public virtual async Task<Model.Proizvodi> Activate(int id)
        {
            return await (_service as IProizvodiService).Activate(id);
        }
    }
}
