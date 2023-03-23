using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;

namespace eProdaja.Services
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Database.Korisnici, Model.Korisnici>();
            CreateMap<Model.Requests.KorisniciInsertRequest, Database.Korisnici>();
            CreateMap<Model.Requests.KorisniciUpdateRequest, Database.Korisnici>();

            CreateMap<Database.Proizvodi, Model.Proizvodi>();

            CreateMap<Database.JediniceMjere, Model.JediniceMjere>();

            CreateMap<Database.VrsteProizvodum, Model.VrsteProizvodum>();
        }
    }

    //public UserProfile()
    //{
    //    CreateMap<User, UserViewModel>();
    //}
}
