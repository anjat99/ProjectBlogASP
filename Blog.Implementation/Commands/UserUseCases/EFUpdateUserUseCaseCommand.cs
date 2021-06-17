using AutoMapper;
using Blog.Application.Commands.UserUseCases;
using Blog.Application.DataTransfer.UserUseCases;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.UserUseCases;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCases
{
    public class EFUpdateUserUseCaseCommand : IUpdateUserUseCaseCommand
    {
        private readonly BlogContext _context;
        private readonly UpdateUserUseCaseValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateUserUseCaseCommand(BlogContext context, UpdateUserUseCaseValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 24;

        public string Name => "Update UseCases Of User";

        public void Execute(UserUseCaseDto request)
        {
            _validator.ValidateAndThrow(request);

            var useCase = _context.UserUseCases.Find(request.Id);

            if (useCase == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(UserUseCase));
            }

            var userUseCase = _context.UserUseCases.Where(x => x.Id == request.Id).FirstOrDefault();
            _mapper.Map(request, userUseCase);

            _context.SaveChanges();
        }
    }
}
