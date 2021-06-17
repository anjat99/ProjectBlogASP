using Blog.Application.Commands.Users;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EFDeleteUserCommand : IDeleteUserCommand
    {
        private readonly BlogContext _context;

        public EFDeleteUserCommand(BlogContext context)
        {
            _context = context;
        }

        public int Id => 18;

        public string Name => "Deleting Existing User";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            user.SoftDelete();
            _context.SaveChanges();
        }
    }
}
