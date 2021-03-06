﻿using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace FeelItaly.Models{

    public class Historico{

        [Key]
        [Required]
        public int idHistorico { set; get; }

        [Required]
        public int idReceita { set; get; }

        [NotMapped]
        [JsonIgnore]
        public Receita Receita { set; get; }

        //[Key]
        [Required]
        public string username { set; get; }

        [NotMapped]
        [JsonIgnore]
        public Utilizador Utilizador { set; get; }

        //[Key]
        [Required]
        public int idPasso { set; get; }

        [NotMapped]
        [JsonIgnore]
        public Passo Passo { set; get; }

        [Required]
        public double TempoPasso { set; get; }

        [Required]
        public DateTime Dataa { set; get; }

        [Required]
        public int NrPasso { set; get; }

    }

    public class HistoricoContext : DbContext
    {

        public HistoricoContext(DbContextOptions<HistoricoContext> options)
            : base(options)
        {
        }

        public DbSet<Historico> historico { set; get; }

    }
}
