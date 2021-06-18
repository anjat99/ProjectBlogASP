using Blog.Api.Core;
using Blog.Application;
using Blog.Application.Commands.Categories;
using Blog.Application.Commands.Users;
using Blog.Application.Email;
using Blog.Application.Queries;
using Blog.DataAccess;
using Blog.Implementation.Commands.Categories;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Email;
using Blog.Implementation.Extensions;
using Blog.Implementation.Logging;
using Blog.Implementation.Queries.AuditLogs;
using Blog.Implementation.Queries.Categories;
using Blog.Implementation.Queries.Comments;
using Blog.Implementation.Queries.Posts;
using Blog.Implementation.Queries.Users;
using Blog.Implementation.Validators;
using Blog.Implementation.Validators.Categories;
using Blog.Implementation.Validators.Users;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<BlogContext>();
            services.AddUsesCases();
            services.AddHttpContextAccessor();
            services.AddApplicationActor();
            services.AddTransient<IUseCaseLogger, DBUseCaseLogger>();
            services.AddJwt();
            services.AddTransient<IEmailSender, SMTPEmailSender>();
            services.AddControllers();

            //automapper
            services.AddAutoMapper(typeof(EFGetCategoriesQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetCategoryQuery).Assembly);
            //services.AddAutoMapper(typeof(EFGetPostsQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetAllPostsQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetPostQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetCommentQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetAuditLogsQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetUsersQuery).Assembly);
            services.AddAutoMapper(typeof(EFGetUserQuery).Assembly);


            services.AddAutoMapper(typeof(QueryableExtensions).Assembly);
            services.AddAutoMapper(this.GetType().Assembly);

            //SWAGGER
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Blog Project", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                        },
                        new List<string>()
                    }
                });
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //SWAGGER
            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseRouting();
            app.UseStaticFiles();
            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
