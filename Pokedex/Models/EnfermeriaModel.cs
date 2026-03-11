using System.ComponentModel.DataAnnotations;

namespace Pokedex.Models
{
    public class EnfermeriaModel
    {
        [Key]
        public int AtencionID { get; set; }

        [Required]
        public string NombrePokemon { get; set; }

        [Required]
        public string NombreDuenno { get; set; }

        [Required]
        public string Padecimiento { get; set; }

        public string? Estado { get; set; }
    }
}
