var documentWidth = document.documentElement.clientWidth;
var documentHeight = document.documentElement.clientHeight;

var cursor = document.getElementById("cursor");
var cursorX = documentWidth / 2;
var cursorY = documentHeight / 2;

jQuery.noConflict();
jQuery(document).ready(function($) {
    $('.form-control').keyup(function(event) {
        var textBox = event.target;
        var start = textBox.selectionStart;
        var end = textBox.selectionEnd;
        textBox.value = textBox.value.charAt(0).toUpperCase() + textBox.value.slice(1).toLowerCase();
        textBox.setSelectionRange(start, end);
    });
});

function Click(x, y) {
    const element = document.elementFromPoint(x , y);

    console.log(element)

    element.click();
    if (element.focus() !== undefined)
        element.focus().click();
}

function updateCursor(x, y) {
    cursorX = x - 40 ;
    cursorY = y - 5;
    
    cursor.style.left = cursorX + 'px';
    cursor.style.top = cursorY + 'px';
}

window.addEventListener('message', function(event) {
    if (event.data.type == "enableui") {
        cursor.style.display = event.data.enable ? "block" : "none";
        document.body.style.display = event.data.enable ? "flex" : "none";
    }
});

$(document).click(function(event) {
    Click(cursorX + 48, cursorY + 1);
})

$(document).mousemove(function(event) {
    updateCursor(event.pageX, event.pageY)

});

document.onkeyup = function (data) {
    if (data.which == 27) { // Escape key
        $.post('http://esx_identity/escape', JSON.stringify({}));
    }
};

$("#register").submit(function(e) {
    e.preventDefault(); // Prevent form from submitting
    
    $.post('http://esx_identity/register', JSON.stringify({
        firstname: $("#firstname").val(),
        lastname: $("#lastname").val(),
        dateofbirth: $("#dateofbirth").val(),
        sex: $(".sex:checked").val(),
        height: $("#height").val()
    }));
});