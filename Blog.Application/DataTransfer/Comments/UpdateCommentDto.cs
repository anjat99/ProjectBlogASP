using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Comments
{
    public class UpdateCommentDto
    {
        public int Id { get; set; }
        public string Message { get; set; }
    }
}
