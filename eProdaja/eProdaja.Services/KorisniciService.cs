using AutoMapper;
using eProdaja.Model.Requests;
using eProdaja.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace eProdaja.Services
{
    public class KorisniciService : IKorisniciService
    {
        EProdajaContext _context;
        public IMapper _mapper { get; set; }
        public KorisniciService(EProdajaContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public List<Model.Korisnici> Get()
        {
            var entityList = _context.Korisnicis.ToList();

            //var list = new List<Model.Korisnici>();
            //foreach (var item in entityList)
            //{
            //    list.Add(new Model.Korisnici()
            //    {
            //        Email = item.Email,
            //        Ime = item.Ime,
            //        KorisnickoIme = item.KorisnickoIme,
            //        Prezime = item.Prezime,
            //        KorisnikId = item.KorisnikId,
            //        Telefon = item.Telefon,
            //    });
            //}

            //return list;

            return _mapper.Map<List<Model.Korisnici>>(entityList);
        }

        public Model.Korisnici Insert(KorisniciInsertRequest request)
        {
            var entity = new Korisnici();
            _mapper.Map(request, entity);

            entity.LozinkaSalt = GenerateSalt();
            entity.LozinkaHash = GenerateHash(entity.LozinkaSalt, request.Password);

            _context.Korisnicis.Add(entity);
            _context.SaveChanges();

            return _mapper.Map<Model.Korisnici>(entity);
        }

        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);


            return Convert.ToBase64String(byteArray);
        }
        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }

        public Model.Korisnici Update(int id, KorisniciUpdateRequest request)
        {
            var entity = _context.Korisnicis.Find(id);

            _mapper.Map(request, entity);

            _context.SaveChanges();

            return _mapper.Map<Model.Korisnici>(entity);

        }
    }
}
