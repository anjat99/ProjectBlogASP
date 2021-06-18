using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Post : Entity
    {
        public string Cover { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        //public bool IsPublished { get; set; }
        //public DateTime? PublishedAt { get; set; }
        public int CategoryId { get; set; }
        public int UserId { get; set; }
        public virtual Category Category { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<PostComment> PostComments { get; set; } = new HashSet<PostComment>();
    }
}
