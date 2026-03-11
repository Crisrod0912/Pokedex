using Microsoft.AspNetCore.Mvc;
using Pokedex.Data;
using Pokedex.Models;

namespace Pokedex.Controllers
{
    public class MensajesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public MensajesController(ApplicationDbContext context)
        {
            _context = context;
        }

        private bool UsuarioLogueado()
        {
            return HttpContext.Session.GetInt32("IdUsuario") != null;
        }

        public IActionResult Mensajes()
        {
            if (!UsuarioLogueado())
            {
                return RedirectToAction("Index", "Home");
            }

            var mensajes = _context.Mensajes
                                   .OrderBy(m => m.Fecha)
                                   .Select(m => new
                                   {
                                       m.Mensaje,
                                       Usuario = m.Usuario.Usuario,
                                       m.Fecha
                                   }).ToList();

            ViewBag.Mensajes = mensajes;

            return View();
        }

        [HttpGet]
        public IActionResult ObtenerMensajes()
        {
            var mensajes = _context.Mensajes
                                   .OrderBy(m => m.Fecha)
                                   .Select(m => new
                                   {
                                       m.Mensaje,
                                       Usuario = m.Usuario.Usuario,
                                       Fecha = m.Fecha.ToString("dd/MM/yyyy hh:mm:ss tt")
                                   })
                                   .ToList();

            return Json(mensajes);
        }

        [HttpPost]
        public IActionResult Enviar(string texto)
        {
            if (!UsuarioLogueado())
            {
                return RedirectToAction("Index", "Home");
            }

            int? idUsuario = HttpContext.Session.GetInt32("IdUsuario");

            if (idUsuario != null)
            {
                var nuevoMensaje = new MensajeModel
                {
                    IdUsuario = idUsuario.Value,
                    Mensaje = texto,
                    Fecha = DateTime.Now
                };

                _context.Mensajes.Add(nuevoMensaje);
                _context.SaveChanges();
            }

            return RedirectToAction("Mensajes");
        }
    }
}
