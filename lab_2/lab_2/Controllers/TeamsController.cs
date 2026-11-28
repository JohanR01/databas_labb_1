using Microsoft.AspNetCore.Mvc;
using lab_2.Models;

namespace TeamsController.Controllers
{
    public class TeamsController : Controller
    {
        static IList<Team> TeamList = new List<Team>
        {
            new Team() { TeamsID = 1, Name = "McLaren", Country = "Storbritannien" },
            new Team() { TeamsID = 2, Name = "Mercedes", Country = "Tyskland" },
            new Team() { TeamsID = 3, Name = "Red Bull Racing", Country = "Österrike" },
            new Team() { TeamsID = 4, Name = "Ferrari", Country = "Italien" }
        };

        public IActionResult Index()
        {
            return View(TeamList);
        }

        public IActionResult Delete(int id)
        {
            var team = TeamList.FirstOrDefault(t => t.TeamsID == id);
            if (team != null) TeamList.Remove(team);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create (Team team)
        {
            TeamList.Add(team);
            return Redirect ("Index");
        }
    }
}