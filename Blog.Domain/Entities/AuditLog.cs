using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Blog.Domain.Entities
{
    public class AuditLog
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }

        [Required]
        public string  Actor { get; set; }

        [Required]
        public string UseCaseName { get; set; }

        [Required]
        public string Data { get; set; }
    }
}
