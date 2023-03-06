$(document).on('click', '.cancelmenu-button', function(e) {
    e.preventDefault();
    $.post('http://qb-Noodle/Click', JSON.stringify({}))
    $.post('http://qb-Noodle/CloseNui', JSON.stringify({}))
    $(".mainmenu-container").animate({"top": "-30vh"}, 250, function() {
      $('.mainmenu-container').css("display", "none");
   }) 
});

OpenMenu = function() {
  $('.mainmenu-container').css("display", "block");
  $('.mainmenu-container').animate({"top": "30vh"}, 350)
}

// Payment \\

$(document).on('click', '.close-button', function(e) {
    e.preventDefault();
    $.post('http://qb-Noodle/Click', JSON.stringify({}))
    $.post('http://qb-Noodle/CloseNui', JSON.stringify({}))
    $(".mainmenu-container").animate({"top": "-30vh"}, 250, function() {
      $('.mainmenu-container').css("display", "none");
   }) 
});

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "OpenMenu":
          OpenMenu();
          break;
    }
});