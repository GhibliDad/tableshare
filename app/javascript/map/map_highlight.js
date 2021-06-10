function mapHighlights() {
  // Declare all variables
  var markers = document.getElementsByClassName('marker')
  var i = 0
  for (i = 0; i < markers.length; i++) {
      console.log(markers[i])
      markers[i].addEventListener("mouseover", function(){
        console.log(this.id)
        var event_id = 'card_' + this.id
        console.log(event_id)
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

function reverseHighlights() {
// Declare all variables
var cards = document.getElementsByClassName('card-product')
var i = 0
for (i = 0; i < cards.length; i++) {
    console.log(cards[i])
    cards[i].addEventListener("mouseover", function(){
      var marker_id = this.id.split("card_")[1]
      console.log(marker_id)
      var marker = document.getElementById(marker_id)
      console.log(marker)
      marker.classList.add("selected")
    })
    cards[i].addEventListener("mouseleave", function(){
      var marker_id = this.id.split("card_")[1]
      console.log(marker_id)
      var marker = document.getElementById(marker_id)
      console.log(marker)
      marker.classList.remove("selected")
    })
  }
}

export { mapHighlights, reverseHighlights };
