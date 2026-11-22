using Microsoft.AspNetCore.Mvc;
using lab_2.Models;

namespace lab_2.Controllers
{
    public class DriversController : Controller
    {
        static IList<Driver> DriverList = new List<Driver>
        {
            new Driver() { DriversID = 1, Name = "Lando Norris", BirthDateYear = 1999, TeamID = 1 },
            new Driver() { DriversID = 2, Name = "Oscar Piastri", BirthDateYear = 2001, TeamID = 1 },
            new Driver() { DriversID = 3, Name = "George Russell", BirthDateYear = 1998, TeamID = 2 },
            new Driver() { DriversID = 4, Name = "Kimi Antonelli", BirthDateYear = 2006, TeamID = 2 },
            new Driver() { DriversID = 5, Name = "Max Verstappen", BirthDateYear = 1997, TeamID = 3 },
            new Driver() { DriversID = 6, Name = "Isack Hadjar", BirthDateYear = 2004, TeamID = 3 },
            new Driver() { DriversID = 7, Name = "Charles Leclerc", BirthDateYear = 1997, TeamID = 4 },
            new Driver() { DriversID = 8, Name = "Lewis Hamilton", BirthDateYear = 1985, TeamID = 4 }
        };

        public IActionResult Index()
        {
            return View(DriverList);
        }
    }
}
