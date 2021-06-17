using Blog.Application;
using Blog.Application.Commands.Categories;
using Blog.Application.Commands.Comments;
using Blog.Application.Commands.CommentVotes;
using Blog.Application.Commands.Posts;
using Blog.Application.Commands.Users;
using Blog.Application.Commands.UserUseCases;
using Blog.Application.Queries;
using Blog.Application.Queries.AuditLogs;
using Blog.Application.Queries.Categories;
using Blog.Application.Queries.Comments;
using Blog.Application.Queries.Posts;
using Blog.Application.Queries.Users;
using Blog.Implementation.Commands.Categories;
using Blog.Implementation.Commands.Comments;
using Blog.Implementation.Commands.CommentVotes;
using Blog.Implementation.Commands.Posts;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Commands.UserUseCases;
using Blog.Implementation.Queries.AuditLogs;
using Blog.Implementation.Queries.Categories;
using Blog.Implementation.Queries.Comments;
using Blog.Implementation.Queries.Posts;
using Blog.Implementation.Queries.Users;
using Blog.Implementation.Validators.Categories;
using Blog.Implementation.Validators.Comments;
using Blog.Implementation.Validators.CommentVotes;
using Blog.Implementation.Validators.Posts;
using Blog.Implementation.Validators.Users;
using Blog.Implementation.Validators.UserUseCases;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUsesCases(this IServiceCollection services)
        {
            //COMMANDS & QUERIES & VALIDATORS
            //categories
            services.AddTransient<IUpdateCategoryCommand, EFUpdateCategoryCommand>();
            services.AddTransient<ICreateCategoryCommand, EFCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EFDeleteCategoryCommand>();

            services.AddTransient<IGetCategoriesQuery, EFGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EFGetCategoryQuery>();

            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();


            //posts
            services.AddTransient<IUpdatePostCommand, EFUpdatePostCommand>();
            services.AddTransient<ICreatePostCommand, EFCreatePostCommand>();
            services.AddTransient<IDeletePostCommand, EFDeletePostCommand>();

            services.AddTransient<IGetPostsQuery, EFGetPostsQuery>();
            services.AddTransient<IGetPostQuery, EFGetPostQuery>();

            services.AddTransient<CreatePostValidator>();
            services.AddTransient<UpdatePostValidator>();


            //comments
            services.AddTransient<IUpdateCommentCommand, EFUpdateCommentCommand>();
            services.AddTransient<ICreateCommentCommand, EFCreateCommentCommand>();
            services.AddTransient<IDeleteCommentCommand, EFDeleteCommentCommand>();

            services.AddTransient<IGetCommentQuery, EFGetCommentQuery>();

            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<UpdateCommentValidator>();


            //votes
            services.AddTransient<IUpdateCommentVoteCommand, EFUpdateCommentVoteCommand>();
            services.AddTransient<ICreateCommentVoteCommand, EFCreateCommentVoteCommand>();

            services.AddTransient<CreateCommentVoteValidator>();
            services.AddTransient<UpdateCommentVoteValidator>();


            //users
            services.AddTransient<IRegisterUserCommand, EFRegisterUserCommand>();
            services.AddTransient<IUpdateUserCommand, EFUpdateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EFDeleteUserCommand>();

            services.AddTransient<IGetUsersQuery, EFGetUsersQuery>();
            services.AddTransient<IGetUserQuery, EFGetUserQuery>();

            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<LoginUserValidator>();
            services.AddTransient<UpdateUserValidator>();


            //user useCases
            services.AddTransient<IUpdateUserUseCaseCommand, EFUpdateUserUseCaseCommand>();
            services.AddTransient<ICreateUserUseCaseCommand, EFCreateUserUseCaseCommand>();
            services.AddTransient<IDeleteUserUseCaseCommand, EFDeleteUserUseCaseCommand>();

            services.AddTransient<CreateUserUseCaseValidator>();
            services.AddTransient<UpdateUserUseCaseValidator>();


            //audit-logs
            services.AddTransient<IGetAuditLogsQuery, EFGetAuditLogsQuery>();

            services.AddTransient<UseCaseExecutor>();
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;
                var actor = JsonConvert.DeserializeObject<JWTActor>(actorString);

                return actor;

            });
        }


        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JWTManager>();
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

    }
}
