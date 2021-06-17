using AutoMapper;
using Blog.Application.Commands.UserUseCases;
using Blog.Application.DataTransfer.UserUseCases;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.UserUseCases;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCases
{
    public class EFCreateUserUseCaseCommand : ICreateUserUseCaseCommand
    {
        private readonly BlogContext _context;
        private readonly CreateUserUseCaseValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateUserUseCaseCommand(BlogContext context, CreateUserUseCaseValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 23;

        public string Name => "Add UseCases To User";

        public void Execute(UserUseCaseDto request)
        {
            _validator.ValidateAndThrow(request);

            var useCase = _mapper.Map<UserUseCase>(request);

            _context.Add(useCase);
            _context.SaveChanges();
        }
    }
}
