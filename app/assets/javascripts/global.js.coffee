$(document).on "ready page:load", ->
  
  $("div.input.file").append("<a class=\"upload_override\">Choose a file</a>")

  $(".upload_override").click (e) ->
    e.preventDefault
    $(@).prev().click()

  $('.flash').delay(5000).slideUp(1000)

  $("#upload_override").click (e) ->
    e.preventDefault
    $('#job_company_logo').click()
    
  $('select').chosen({disable_search_threshold: 2})


class Map
  constructor: (map_div, point) ->
    @map_div = "##{map_div}"
    @map = new L.Map map_div,
      center: new L.LatLng(point.lat + 0.001, point.long),
      zoom: 14,
      maxZoom: 17,
      minZoom: 11,
      layers: new L.TileLayer('https://a.tiles.mapbox.com/v3/riklomas.gc4l65g7/{z}/{x}/{y}.png', { detectRetina: true }),
      scrollWheelZoom: false

    myIcon = L.icon
      iconUrl: '/assets/marker@2x.png',
      iconSize: [29, 40],
      iconAnchor: [15, 40],
      popupAnchor: [0, -40]

    if point.lat? and point.long?
      L.marker([point.lat, point.long], { icon: myIcon }).addTo(@map)#.bindPopup(point.desc, { maxWidth: 225 }).openPopup()

window.Map = Map

$(document).on "page:load ready", ->

  $(".map").each ->
    $(@).attr("id", "map-" + Math.random().toString().replace("0.", ""))
    m = new Map($(@).attr("id"), {
      lat: $(@).data("lat"),
      long: $(@).data("lng")
    })

