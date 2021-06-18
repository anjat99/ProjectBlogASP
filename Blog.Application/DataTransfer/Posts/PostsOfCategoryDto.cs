using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Posts
{
    public class PostsOfCategoryDto 
    {
        public int Id { get; set; }
        public string Cover { get; set; }
        public string Title { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Username { get; set; }
    }
}
