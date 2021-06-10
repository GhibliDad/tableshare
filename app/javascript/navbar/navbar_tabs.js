  // Declare all variables
  function navTabs() {
    var navbar = document.getElementById("navTabs");
    if (navbar) {
      var profileBtn = document.getElementById("myProfile")
      var reservationBtn = document.getElementById("myReservations")
      var tablesBtn = document.getElementById("myTables")
      var reservations = document.getElementById("reservationsContent")
      var profile = document.getElementById("profileContent")
      var tables = document.getElementById("tablesContent")

      profileBtn.addEventListener("click", function(){
        this.classList.add('active')
        reservationBtn.classList.remove('active')
        tablesBtn.classList.remove('active')
        profile.classList.remove("no_show")
        tables.classList.add("no_show")
        reservations.classList.add("no_show")
      })
      reservationBtn.addEventListener("click", function(){
        this.classList.add('active')
        tablesBtn.classList.remove('active')
        profileBtn.classList.remove('active')
        reservations.classList.remove("no_show")
        tables.classList.add("no_show")
        profile.classList.add("no_show")
      })
      tablesBtn.addEventListener("click", function(){
        this.classList.add('active')
        profileBtn.classList.remove('active')
        reservationBtn.classList.remove('active')
        tables.classList.remove("no_show")
        profile.classList.add("no_show")
        reservations.classList.add("no_show")
      })

    }
  }
export { navTabs };
