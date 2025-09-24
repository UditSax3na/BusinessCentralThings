var MyCustomControl = (function () {
    return {
        init: function (element, events) {
            element.innerHTML = "<div id='msgBox'>Ready</div>";
        },
        ShowMessage: function (msg) {
            document.getElementById("msgBox").innerText = msg; // 
        }
    };
})();