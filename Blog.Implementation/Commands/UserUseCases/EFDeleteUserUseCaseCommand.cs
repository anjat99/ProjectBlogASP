using Blog.Application.Commands.UserUseCases;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCases
{
    public class EFDeleteUserUseCaseCommand : IDeleteUserUseCaseCommand
    {
        private readonly BlogContext _context;

        public EFDeleteUserUseCaseCommand(BlogContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Delete UseCases Of User";

        public void Execute(int request)
        {
            var useCase = _context.UserUseCases.Find(request);

            if (useCase == null)
            {
                throw new EntityNotFoundException(request, typeof(UserUseCase));
            }

            //_context.UserUseCases.Remove(useCase);
            useCase.SoftDelete();

            _context.SaveChanges();
        }
    }
}
