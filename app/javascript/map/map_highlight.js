function mapHighlights() {
  // Declare all variables
  var markers = document.getElementsByClassName('marker')
  var i = 0
  for (i = 0; i < markers.length; i++) {
      console.log(markers[i])
      markers[i].addEventListener("mouseover", function(){
        var event_id = 'card_' + this.id
        var event = document.getElementById(event_id)
        event.classList.add("selected")
      })
      markers[i].addEventListener("mouseleave", function(){
        var event_id = 'card_' + this.id
        var event = document.getElementById(event_id)
        event.classList.remove("selected")
      })
    }
  }

export { mapHighlights };
