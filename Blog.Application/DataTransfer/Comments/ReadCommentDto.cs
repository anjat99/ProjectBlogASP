using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Comments
{
    public class ReadCommentDto
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public UserDto User { get; set; }
        public DateTime CreatedAt { get; set; }
        
    }
}
