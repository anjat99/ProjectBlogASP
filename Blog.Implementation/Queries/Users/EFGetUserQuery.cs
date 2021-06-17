using AutoMapper;
using Blog.Application.DataTransfer.Users;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Users;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Users
{
    public class EFGetUserQuery : IGetUserQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetUserQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "Read Single User";

        public ReadUserDto Execute(int search)
        {
            var u = _context.Users.Find(search);

            if (u == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }

            var query = _context.Users.Include(u => u.UserUseCases).Include(u => u.Posts).ThenInclude(c => c.Category).Where(u => u.Id == search).First();

            var user = _mapper.Map<ReadUserDto>(query);

            return user;
        }
    }
}
