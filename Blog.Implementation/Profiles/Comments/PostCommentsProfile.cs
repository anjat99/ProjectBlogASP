using AutoMapper;
using Blog.Application.DataTransfer.Comments;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.Comments
{
    public class PostCommentsProfile : Profile
    {
        public PostCommentsProfile()
        {
            CreateMap<Comment, ReadCommentDto>();
            CreateMap<ReadCommentDto, Comment>();
        }
    }
}
