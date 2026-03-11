using Microsoft.AspNetCore.Mvc;

namespace Pokedex.Controllers
{
    public class PokedexController : Controller
    {
        public IActionResult Pokedex()
        {
            return View();
        }
    }
}
