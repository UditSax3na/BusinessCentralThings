function showPopup(msg) {
    let container = $("<div>")
        .addClass("popup-container")
        .text(msg);
    $("body").append(container);
    setTimeout(function() {
        container.remove();
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('popUpClosed');
    }, 10000);
};