using Blog.Application.DataTransfer.Posts;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Categories
{
    public class ReadCategoryDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<PostsOfCategoryDto> Posts { get; set; } = new List<PostsOfCategoryDto>();
        //public ICollection<PostDto> Posts { get; set; } = new List<PostDto>();
    }
}
