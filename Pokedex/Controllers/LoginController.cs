using Microsoft.AspNetCore.Mvc;
using Pokedex.Data;

namespace Pokedex.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;

        public LoginController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public IActionResult Login(string Username, string Password)
        {
            var user = _context.Usuarios.FirstOrDefault(u => u.Usuario == Username);

            if (user != null && BCrypt.Net.BCrypt.Verify(Password, user.Contrasenna))
            {
                HttpContext.Session.SetInt32("IdUsuario", user.IdUsuario);
                HttpContext.Session.SetString("NombreUsuario", user.Usuario);

                return RedirectToAction("Pokedex", "Pokedex");
            }

            ViewBag.Error = "Usuario o contraseña incorrectos.";

            return View();
        }
    }
}
