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
    public class EFGetPostsQuery : IGetPostsQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetPostsQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "Post Search";

        public PagedResponse<PostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) || !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Keyword.ToLower()) || x.Description.ToLower().Contains(search.Keyword.ToLower()));
            }

            //if (search.CategoryIds.Any())
            //{
            //    query = query.Where(x => search.CategoryIds.Contains(x.CategoryId));
            //}

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


            return query.Paged<PostDto, Post>(search, _mapper);
        }
    }
}
