using AutoMapper;
using Blog.Application.DataTransfer.Categories;
using Blog.Application.DataTransfer.Posts;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Profiles.Categories
{
    public class GetCategoryProfile : Profile
    {
        public GetCategoryProfile()
        {
            CreateMap<Category, ReadCategoryDto>()
                .ForMember(dto => dto.Posts, opt => opt.MapFrom(x => x.Posts.Select(x => new PostsOfCategoryDto
                {
                    Id = x.Id,
                    Cover = x.Cover,
                    Title = x.Title,
                    Username = x.User.Username,
                    CreatedAt = x.CreatedAt
                }).ToList()));
            

            CreateMap<ReadCategoryDto, Category>();
            

        }
    }
}
