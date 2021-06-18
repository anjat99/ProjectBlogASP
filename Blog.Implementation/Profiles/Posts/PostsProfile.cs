using AutoMapper;
using Blog.Application.DataTransfer.Posts;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.Posts
{
    public class PostsProfile : Profile
    {
        public PostsProfile()
        {
            CreateMap<Post, PostsDto>();
                //ForMember(x => x.CategoryName, opt => opt.MapFrom(x => x.Category.Name)).ForMember(x => x.Username, opt => opt.MapFrom(x => x.User.Username));
            //.ForMember(x => x.Cover, opt => opt.Ignore())
            //.ForMember(x => x.Category, opt => opt.Ignore());

            CreateMap<PostsDto, Post>();
                //.ForMember(x => x.PostComments, opt => opt.Ignore());
        }
    }
}
