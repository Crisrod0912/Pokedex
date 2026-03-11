using Microsoft.AspNetCore.Mvc;
using Pokedex.Data;
using Pokedex.Models;

namespace Pokedex.Controllers
{
    public class RegistroController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RegistroController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public IActionResult Registro()
        {
            var usuario = new UsuariosModel
            {
                Usuario = Request.Form["Usuario"],
                NombreUsuario = Request.Form["NombreUsuario"],
                Contrasenna = BCrypt.Net.BCrypt.HashPassword(Request.Form["Contrasena"]),
                Rol = Request.Form["Rol"]
            };

            if (string.IsNullOrEmpty(usuario.Usuario) ||
                string.IsNullOrEmpty(usuario.NombreUsuario) ||
                string.IsNullOrEmpty(usuario.Contrasenna) ||
                string.IsNullOrEmpty(usuario.Rol))
            {
                ModelState.AddModelError(string.Empty, "Todos los campos son obligatorios.");

                return View(usuario);
            }

            try
            {
                _context.Usuarios.Add(usuario);
                _context.SaveChanges();

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, "Hubo un error al registrar el usuario. Inténtalo nuevamente.");

                return View(usuario);
            }
        }
    }
}
