using Blog.Application.DataTransfer.Categories;
using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Posts
{
    public class ReadPostDto
    {
        public int Id { get; set; }
        public string Cover { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsPublished { get; set; }
        public DateTime? PublishedAt { get; set; }
        public CategoryDto Category { get; set; }
        public UserDto User { get; set; }


        //public ICollection<SingleCommentDto> Comments { get; set; } = new List<SingleCommentDto>();
        //public ICollection<LikePostDto> Likes { get; set; } = new List<LikePostDto>();
    }
}
