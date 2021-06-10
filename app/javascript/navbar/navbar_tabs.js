  // Declare all variables
  function navTabs(evt, tabTitle) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  var tabTitle = document.getElementById(tabTitle)
  if (tabTitle) {
    tabTitle.style.display = "block";
  }
  if (evt) {
    evt.currentTarget.className += " active";
    }
  }



  var defaultOpen =  document.getElementById("defaultOpen")
  if(defaultOpen) {
    defaultOpen.click();
  }


export { navTabs };
