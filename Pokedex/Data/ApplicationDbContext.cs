using Microsoft.EntityFrameworkCore;
using Pokedex.Models;

namespace Pokedex.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<UsuariosModel> Usuarios { get; set; }
        public DbSet<EnfermeriaModel> Enfermeria { get; set; }
        public DbSet<MensajeModel> Mensajes { get; set; }
        public DbSet<EntrenadoresModel> Entrenador { get; set; }
        public DbSet<EquipoLuchaModel> Equipo { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UsuariosModel>().ToTable("Usuarios");
            modelBuilder.Entity<EnfermeriaModel>().ToTable("Enfermeria");
            modelBuilder.Entity<EnfermeriaModel>().HasKey(e => e.AtencionID);
            modelBuilder.Entity<MensajeModel>().ToTable("Mensajes");
            modelBuilder.Entity<EntrenadoresModel>().ToTable("Entrenador");
            modelBuilder.Entity<EquipoLuchaModel>().ToTable("Equipo");
        }
    }
}
