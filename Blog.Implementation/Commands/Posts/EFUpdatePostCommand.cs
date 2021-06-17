using AutoMapper;
using Blog.Application;
using Blog.Application.Commands.Posts;
using Blog.Application.DataTransfer.Posts;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
  
    public class EFUpdatePostCommand : IUpdatePostCommand
    {
        private readonly BlogContext _context;
        private readonly IApplicationActor _actor;
        private readonly UpdatePostValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdatePostCommand(BlogContext context, UpdatePostValidator validator, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 9;

        public string Name => "Updating Existing Post";

        public void Execute(PostDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = _context.Posts.Find(request.Id);

            if (post == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Post));
            }

            if (_actor.Id != post.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }


            var result = _context.Posts.Include(x => x.User).Include(x => x.Category).FirstOrDefault(x => x.Id == request.Id);

            var  newFileName = CoverImage.UpdateCoverImage(request.Cover, result.Cover);
            
            _mapper.Map(request, result);
            result.Cover = newFileName; 

            _context.SaveChanges();
        }
    }
}
