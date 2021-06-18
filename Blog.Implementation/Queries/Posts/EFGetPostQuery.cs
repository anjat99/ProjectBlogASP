using AutoMapper;
using Blog.Application.DataTransfer.Comments;
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

        public ReadPostDto Execute(int id)
        {
            var post = _context.Posts
                .Include(c => c.Category)
                .Include(u => u.User)
                .Include(p => p.PostComments)
                .ThenInclude(pc => pc.Comment)
                .ThenInclude(c => c.CommentVotes)
                .FirstOrDefault(x => x.Id == id);

           
            if (post == null)
            {
                throw new EntityNotFoundException(id, typeof(Post));
            }



            var result = _mapper.Map<ReadPostDto>(post); 

            return result;
        }
    }
}
