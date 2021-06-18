using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Comment : Entity
    {
        public string Message { get; set; }
        public int UserId { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<PostComment> CommentPosts { get; set; } = new HashSet<PostComment>();
        public virtual ICollection<Vote> CommentVotes { get; set; } = new HashSet<Vote>();
    }
}
