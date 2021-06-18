using AutoMapper;
using Blog.Application.DataTransfer.Posts;
using Blog.Application.Queries;
using Blog.Application.Queries.Posts;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Posts
{
    public class EFGetAllPostsQuery : IGetAllPostsQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetAllPostsQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 26;

        public string Name => "Search of posts";

        public PagedResponse<PostsDto> Execute(PostSearch search)
        {
            var query = _context.Posts.Include(x=>x.Category).Include(x=>x.User).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) || !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Keyword.ToLower()) || x.Description.ToLower().Contains(search.Keyword.ToLower()));
            }


            if (search.CategoryId.HasValue)
            {
                query = query.Where(x => x.CategoryId == search.CategoryId);
            }

            if (search.DateFrom.HasValue)
            {
                query = query.Where(x => x.CreatedAt >= search.DateFrom);
            }

            if (search.DateTo.HasValue)
            {
                query = query.Where(x => x.CreatedAt <= search.DateTo);
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PagedResponse<PostsDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Select(x => new PostsDto
                {
                    Id = x.Id,
                    Cover = x.Cover,
                    Title = x.Title,
                    Description = x.Description,
                    Username = x.User.Username,
                    CategoryName = x.Category.Name,
                    CreatedAt = x.CreatedAt
                })

            };

            return response;

            // return query.Paged<PostsDto, Post>(search, _mapper); //ne radi
        }
    }
}
