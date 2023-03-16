using System;
using System.Collections.Generic;

namespace eProdaja.Services.Database;

public partial class Proizvodi
{
    public int ProizvodId { get; set; }

    public string Naziv { get; set; } = null!;

    public string Sifra { get; set; } = null!;

    public decimal Cijena { get; set; }

    public int VrstaId { get; set; }

    public int JedinicaMjereId { get; set; }

    public byte[]? Slika { get; set; }

    public byte[]? SlikaThumb { get; set; }

    public bool? Status { get; set; }

    public string? StateMachine { get; set; }

    public virtual ICollection<IzlazStavke> IzlazStavkes { get; } = new List<IzlazStavke>();

    public virtual JediniceMjere JedinicaMjere { get; set; } = null!;

    public virtual ICollection<NarudzbaStavke> NarudzbaStavkes { get; } = new List<NarudzbaStavke>();

    public virtual ICollection<Ocjene> Ocjenes { get; } = new List<Ocjene>();

    public virtual ICollection<UlazStavke> UlazStavkes { get; } = new List<UlazStavke>();

    public virtual VrsteProizvodum Vrsta { get; set; } = null!;
}
