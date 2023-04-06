using AutoMapper;
using eProdaja.Model;
using eProdaja.Model.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Services.ProizvodiStateMachine
{
    public class InitialProductState : BaseState
    {
        public InitialProductState(IServiceProvider serviceProvider, Database.EProdajaContext context, IMapper mapper) : base(serviceProvider,context, mapper)
        {
        }

        public override async Task<Proizvodi> Insert(ProizvodiInsertRequest request)
        {
            //TODO: EF CALL
            var set = _context.Set<Database.Proizvodi>();

            var entity = _mapper.Map<Database.Proizvodi>(request);

            entity.StateMachine = "draft";

            set.Add(entity);

            await _context.SaveChangesAsync();
            return _mapper.Map<Proizvodi>(entity);
        }
    }
}
