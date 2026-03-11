using Microsoft.AspNetCore.Mvc;
using Pokedex.Data;

namespace Pokedex.Controllers
{
    public class EntrenadoresController : Controller
    {
        private readonly ApplicationDbContext _context;

        public EntrenadoresController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Entrenadores()
        {
            var entrenadores = _context.Entrenador.ToList();

            return View(entrenadores);
        }
    }
}
