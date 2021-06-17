using Blog.Application.DataTransfer.Categories;
using Blog.Application.DataTransfer.Users;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Posts
{
    public class PostDto
    {
        public int Id { get; set; }
        public IFormFile Cover { get; set; }
        //public string CoverImage { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int? CategoryId { get; set; }
        public int? UserId { get; set; }
    }
}
