using AutoMapper;
using Blog.Application.DataTransfer.CommentVotes;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.CommentVotes
{
    public class CreateCommentVoteProfile : Profile
    {
        public CreateCommentVoteProfile()
        {
            CreateMap<CommentVoteDto, Vote>();
            CreateMap<Vote, CommentVoteDto>();
        }
    }
}
