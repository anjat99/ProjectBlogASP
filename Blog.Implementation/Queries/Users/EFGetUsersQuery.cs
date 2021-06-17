using AutoMapper;
using Blog.Application.DataTransfer.Users;
using Blog.Application.Queries;
using Blog.Application.Queries.Users;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Users
{
    public class EFGetUsersQuery : IGetUsersQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetUsersQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 21;

        public string Name => "Search Users" ;

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = _context.Users.OrderByDescending(x => x.CreatedAt).Include(x => x.UserUseCases).AsQueryable(); //join user with usecases

            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Email) || !string.IsNullOrWhiteSpace(search.Email))
            {
                query = query.Where(x => x.Email.ToLower().Contains(search.Email.ToLower()));
            }


            return query.Paged<UserDto, User>(search, _mapper);
        }
    }
}
