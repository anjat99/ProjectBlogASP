using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Blog.Domain.Entities
{
    public class UserUseCase : Entity
    {
        [Required]
        public int UserId { get; set; }
        [Required]
        public int UseCaseId { get; set; }
        public virtual User User { get; set; }
      
    }
}
