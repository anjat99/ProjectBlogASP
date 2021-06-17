using AutoMapper;
using Blog.Application.DataTransfer.CommentVotes;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.CommentVotes
{
    public class CommentVotesProfile : Profile
    {
        public CommentVotesProfile()
        {
            CreateMap<UpdateCommentVoteDto, Vote>();
            CreateMap<Vote, UpdateCommentVoteDto>();
        }
    }
}
