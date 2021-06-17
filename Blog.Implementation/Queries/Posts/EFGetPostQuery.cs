using AutoMapper;
using Blog.Application.DataTransfer.Posts;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Posts;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Posts
{
    public class EFGetPostQuery : IGetPostQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetPostQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 11;

        public string Name => "Single Post";

        public ReadPostDto Execute(int search)
        {
            var p = _context.Posts.Find(search);

            if (p == null)
            {
                throw new EntityNotFoundException(search, typeof(Post));
            }

            var post = _context.Posts
                .Include(u => u.User)
                .Include(c => c.Category)
                .Include(x => x.User)
                .Where(x => x.Id == search)
                .FirstOrDefault();

            var result = _mapper.Map<ReadPostDto>(post);

            return result;
        }
    }
}
