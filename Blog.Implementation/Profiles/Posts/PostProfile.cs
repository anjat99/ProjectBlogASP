using AutoMapper;
using Blog.Application.DataTransfer.Posts;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.Posts
{
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Post, PostDto>().ForMember(x => x.Cover, opt => opt.Ignore());
           
            CreateMap<PostDto, Post>()
                .ForMember(x => x.Cover, opt => opt.Ignore());
        }
    }
}
