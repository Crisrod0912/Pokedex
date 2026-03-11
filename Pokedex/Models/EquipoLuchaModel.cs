using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Pokedex.Models
{
    public class EquipoLuchaModel
    {
        [Key]
        public string NombreEquipo { get; set; }

        [Required]
        public int IdUsuario { get; set; }

        [ForeignKey("IdUsuario")]
        public UsuariosModel Usuario { get; set; }
    }
}
