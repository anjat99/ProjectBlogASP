using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Vote : Entity
    {
        public int? Mark { get; set; }
        public int CommentId { get; set; }
        public int UserId { get; set; }
        public virtual Comment Comment { get; set; }
        public virtual User User { get; set; }
    }
}
