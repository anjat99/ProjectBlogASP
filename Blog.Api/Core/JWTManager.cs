﻿using Blog.DataAccess;
using Blog.Implementation.Commands.Users;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Api.Core
{
    public class JWTManager
    {
        private readonly BlogContext _context;

        public JWTManager(BlogContext context)
        {
            _context = context;
        }

        public string MakeToken(string username, string password)
        {
            var hashedPassword = HashPassword.Encrypt(password);

            var user = _context.Users.Include(u => u.UserUseCases)
                .FirstOrDefault(x => x.Username == username && x.Password == hashedPassword);

            if (user == null)
            {
                return null;
            }

            var actor = new JWTActor
            {
                Id = user.Id,
                AllowedUseCases = user.UserUseCases.Select(x => x.UseCaseId),
                Identity = user.Username
            };

            var issuer = "asp_api";
            var secretKey = "ThisIsMyVerySecretKey";
            var claims = new List<Claim> // Jti : "", 
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "asp_api", ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddSeconds(1200),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
