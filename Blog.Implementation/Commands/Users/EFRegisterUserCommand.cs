using Blog.Application.Commands.Users;
using Blog.Application.DataTransfer.Email;
using Blog.Application.DataTransfer.Users;
using Blog.Application.Email;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Users;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EFRegisterUserCommand : IRegisterUserCommand
    {
        private readonly BlogContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IEnumerable<int> useCasesForUser = new List<int> { 4,5,7,8,9,11,12,13,14,15,16,17,26 };
        //private readonly IEnumerable<int> useCasesForUser = new List<int> { 4,5,6,7,8,9,11,12,13,14,15,16,17,26 };
        //private readonly IEnumerable<int> useCasesForUser = new List<int> { 1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,26 };
        public EFRegisterUserCommand(BlogContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 6;

        public string Name => "User Registration";

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Email = request.Email,
                Password = HashPassword.Encrypt(request.Password)
            };

            _context.Users.Add(user);

            foreach (var id in useCasesForUser)
            {
                user.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = id
                });
            }

            _context.SaveChanges();

            _sender.SendEmail(new SendEmailDto
            {
                 Subject = "Registration",
                 Content = "<h1> Successfull Registration! </h1>",
                 SendTo = request.Email
            });
        }
    }
}
