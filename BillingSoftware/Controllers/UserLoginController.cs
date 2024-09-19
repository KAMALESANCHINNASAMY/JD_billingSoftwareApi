using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.ComponentModel.Design;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Twilio.TwiML.Messaging;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserLoginController : ControllerBase
    {
        private readonly UserProfileDbContext _context;

        public UserLoginController(UserProfileDbContext context)
        {
            _context = context;
        }

        public string RefreshToken { get; private set; }

        [HttpPost("authenticate")]
        public async Task<IActionResult> Authenticate(UserLoginModel userObj)
        {
            try
            {
                if (userObj.email == null || userObj.password == null)
                    return BadRequest();

                // Fetch user by username
                var user = await _context.Users
                    .FirstOrDefaultAsync(x => x.email == userObj.email && x.password == userObj.password);

                if (user == null)
                    return Ok(new { Message = "User not found!" });

                // Generate JWT token
               var Token = CreateJwt(user);
                var newAccessToken = Token;
                var newRefreshToken = CreateRefreshToken(user.userid);
                RefreshToken = newRefreshToken;
                var RefreshTokenExpiryTime = DateTime.Now.AddDays(1);
                // Save changes to the database
                await _context.SaveChangesAsync();

                return Ok(new
                {
                    Token = Token,
                    userid=user.userid,
                    companyid=user.m_companyid,
                    Message = "Login Success!",

                    AccessToken = newAccessToken,
                    RefreshToken = newRefreshToken
                });
            }
            catch (Exception ex)
            {
                // Handle exception
                return StatusCode(500, new { Message = "An error occurred while processing your request." });
            }
        }

        private string CreateJwt(UserLoginModel user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
           //  var key = Encoding.ASCII.GetBytes("veryverysceret.....");
            var key = Encoding.ASCII.GetBytes("veryverysceret.....");
            var identity = new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.Name, user.user_name),
            });

            var credentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = identity,
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = credentials
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            return jwtTokenHandler.WriteToken(token);
        }


        private string CreateRefreshToken(int userId)
        {
            var tokenBytes = new byte[64];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(tokenBytes);
            }

            var refreshToken = Convert.ToBase64String(tokenBytes);

            // Update the user's RefreshToken in the database
           // var user = await _context.Users
                   //.FirstOrDefaultAsync(x => x.email == userObj.email && x.password == userObj.password);
            var user = _context.Users.FirstOrDefault(u => u.userid == userId);
            if (user != null)
            {
                RefreshToken = refreshToken;
                _context.SaveChanges();
            }

            return refreshToken;
        }



        private ClaimsPrincipal GetPrincipalFromToken(string token)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("veryverysceret.....");

            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false
            };

            try
            {
                var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out var validatedToken);
                if (!IsJwtWithValidSecurityAlgorithm(validatedToken))
                {
                    return null;
                }

                return principal;
            }
            catch
            {
                return null;
            }
        }

        private bool IsJwtWithValidSecurityAlgorithm(SecurityToken validatedToken)
        {
            return (validatedToken is JwtSecurityToken jwtSecurityToken) &&
                   jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256,
                       StringComparison.InvariantCultureIgnoreCase);
        }
    }
}
