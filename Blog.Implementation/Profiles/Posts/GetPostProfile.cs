using AutoMapper;
using Blog.Application.DataTransfer.Comments;
using Blog.Application.DataTransfer.Posts;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Profiles.Posts
{
    public class GetPostProfile : Profile
    {
        public GetPostProfile()
        {
            CreateMap<Post, ReadPostDto>()
                .ForMember(x => x.CategoryName, opt => opt.MapFrom(x => x.Category.Name))
                .ForMember(x => x.Username, opt => opt.MapFrom(x => x.User.Username))
                .ForMember(dto => dto.Comments, opt => opt.MapFrom(x => x.PostComments.Select(y => new CommentOfPostDto
                { 
                    Message = y.Comment.Message,
                    User = y.Comment.User.Username
            }).ToList()));
            CreateMap<ReadPostDto, Post>().ForMember(dto => dto.PostComments, opt => opt.Ignore());
        }
    }
}
