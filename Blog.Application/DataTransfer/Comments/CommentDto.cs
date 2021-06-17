using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Comments
{
    public class CommentDto
    {
        public string Message { get; set; }
        public int? UserId { get; set; }
        public int? PostId { get; set; }
    }
}
