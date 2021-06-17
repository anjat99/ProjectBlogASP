using AutoMapper;
using Blog.Application.Commands.Posts;
using Blog.Application.DataTransfer.Posts;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
    public class EFCreatePostCommand : ICreatePostCommand
    {
        private readonly BlogContext _context;
        private readonly CreatePostValidator _validator;
        private readonly IMapper _mapper;

        public EFCreatePostCommand(BlogContext context, CreatePostValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 7;

        public string Name => "Create New Post";

        public void Execute(PostDto request)
        {
            _validator.ValidateAndThrow(request);

            var newFileName = CoverImage.UploadCoverImage(request.Cover);

            var post = _mapper.Map<Post>(request);
            post.Cover = newFileName;
            post.IsPublished = false;

            _context.Posts.Add(post);
            _context.SaveChanges();
        }
    }
}
