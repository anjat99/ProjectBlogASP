using Blog.Application.DataTransfer.Categories;
using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Posts
{
    public class PostsDto
    {
        public int Id { get; set; }
        public string Cover { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CategoryName { get; set; }
        public string Username { get; set; }

    }
}
