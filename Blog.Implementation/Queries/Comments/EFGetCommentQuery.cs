using AutoMapper;
using Blog.Application.DataTransfer.Comments;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Comments;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Comments
{
    public class EFGetCommentQuery : IGetCommentQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetCommentQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 15;

        public string Name => "Single Comment";

        public ReadCommentDto Execute(int search)
        {
            var comm = _context.Comments.Find(search);

            if (comm == null)
            {
                throw new EntityNotFoundException(search, typeof(Comment));
            }

            var comment = _context.Comments.Include(x => x.CommentPosts).ThenInclude(p=>p.Post).Where(x => x.Id == search).FirstOrDefault();

            var result = _mapper.Map<ReadCommentDto>(comment);

            return result;
        }
    }
}
