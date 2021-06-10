function mapHighlights() {
  // Declare all variables
  if (document.getElementById("index_events")) {
    var markers = document.getElementsByClassName('marker')
    var i = 0
    for (i = 0; i < markers.length; i++) {
        console.log(markers[i])
        markers[i].addEventListener("mouseover", function(){
          this.classList.add('selected')
          var event_id = 'card_' + this.id
          var event = document.getElementById(event_id)
          event.classList.add("selected")
        })
        markers[i].addEventListener("mouseleave", function(){
          this.classList.remove('selected')
          var event_id = 'card_' + this.id
          var event = document.getElementById(event_id)
          event.classList.remove("selected")
        })
      }
  }
}

function reverseHighlights() {
// Declare all variables
if (document.getElementById("index_events")) {
  var cards = document.getElementsByClassName('card-product')
  var i = 0
  for (i = 0; i < cards.length; i++) {
      console.log(cards[i])
      cards[i].addEventListener("mouseover", function(){
        var marker_id = this.id.split("card_")[1]
        var marker = document.getElementById(marker_id)
        marker.classList.add("selected")
      })
      cards[i].addEventListener("mouseleave", function(){
        var marker_id = this.id.split("card_")[1]
        var marker = document.getElementById(marker_id)
        marker.classList.remove("selected")
      })
    }
  }
}

export { mapHighlights, reverseHighlights };
