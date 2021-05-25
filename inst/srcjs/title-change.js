Shiny.addCustomMessageHandler('updateWindowTitle', function(message) {
  if (!message.inactive) {
    window.document.title = message.title;
    return;
  } else {
    var current_title = window.document.title;

    if (!document.hasFocus()) {
      if (message.revert_focus) {
        window.onfocus = function(e) {
          window.document.title = current_title;
          window.onfocus = null;
        }
      }

      window.document.title = message.title;
    }
  }
});

Shiny.addCustomMessageHandler('flashWindowTitle', function(message) {
  var current_title = window.document.title;
  var new_title = message.title;
  var title_flag = false;
  var pulse = true;

  if (message.revert_mouse) {
    window.onmousemove = function(e) {
      pulse = false;
      window.document.title = current_title;
      window.onmousemove = null;
    }
  }

  if (!document.hasFocus() && message.revert_focus) {
    window.onfocus = function(e) {
      pulse = false;
      window.document.title = current_title;
      window.onfocus = null;
    }
  }

  updateTitle = function() {
    if (!pulse) {
      return;
    }
    window.document.title = title_flag ? current_title : new_title;
    title_flag = !title_flag;
    return;
  }

  var flashInterval = setInterval(updateTitle, message.interval);

  if (message.duration > 0) {
     setTimeout(() => {
       clearInterval(flashInterval);
       window.document.title = current_title;
     }, message.duration);
  }
});
