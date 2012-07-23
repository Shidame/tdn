selectBuildingToConstruct = ->
  $("#new-building").remove()
  window.newBuilding = {}
  window.newBuilding.buildingTypeId = $(this).data("id");
  window.newBuilding.size = $(this).data("size")

constructBuilding = ->
  if window.newBuilding?.buildingTypeId
    window.newBuilding.tileId = $(this).data("id")
    data = { tile_id: window.newBuilding.tileId, building_type_id: window.newBuilding.buildingTypeId }

    $.post('/buildings', data, (data) -> $(this).css("background-image", "url("+image_path('buildings/hut1.png')+")"))
    delete window.newBuilding


$("#buildings").on("click", ".new-building", selectBuildingToConstruct);
$("#maps").on("click", ".grid", constructBuilding);

$(".grid").mouseenter( ->
  if window.newBuilding?.buildingTypeId
    $(this).css("background-image", "url("+image_path('buildings/hut1.png')+")")
)
$(".grid").mouseleave( ->
  if window.newBuilding?.buildingTypeId
    $(this).css("background-image", "")
)

