using AutoMapper;
using Blog.Application.Commands.Users;
using Blog.Application.DataTransfer.Users;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Users;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EFUpdateUserCommand : IUpdateUserCommand
    {
        private readonly BlogContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateUserCommand(BlogContext context, UpdateUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 19;

        public string Name => "Updating Existing User";

        public void Execute(UserDto request)
        {
            _validator.ValidateAndThrow(request);

            var findUser = _context.Users.Find(request.Id);

            if (findUser == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            var user = _context.Users.Include(x => x.UserUseCases).Where(x => x.Id == request.Id).First();

            //_mapper.Map(request, user);

            foreach (var id in user.UserUseCases)
            {
                _context.Remove(id);
            }

            foreach (var idUc in request.UserUseCases)
            {
                _context.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = idUc,
                    UserId = request.Id
                });
            }

            _mapper.Map(request, user);

            _context.SaveChanges();
        }
    }
}
