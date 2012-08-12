function init () {
 $(".vote").each(function () {
  this.vote = 0;
  this.onmouseover = function () {
   x = this;
   onmousemove = function (e) {
    if ((e.pageY - x.offsetTop) * 2 < x.offsetHeight) {x.innerHTML = "&uArr;"}
    else {x.innerHTML = "&dArr;"}
   };
   onmousedown = function (e) {
    if ((e.pageY - x.offsetTop) * 2 < x.offsetHeight) {
     if (x.vote == 1) {
      x.vote = 0;
      x.href = x.href.split("?")[0] + "?upvote=-1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) - 1;
      x.title = "+" + (parseInt(x.title.split(",")[0]) - 1) + "," + x.title.split(",")[1]
     }
     else if (x.vote == 0) {
      x.vote = 1;
      x.href = x.href.split("?")[0] + "?upvote=1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) + 1;
      x.title = "+" + (parseInt(x.title.split(",")[0]) + 1) + "," + x.title.split(",")[1]
     }
     else if (x.vote == -1) {
      x.vote = 1;
      x.href = x.href.split("?")[0] + "?upvote=1&downvote=-1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) + 2;
      x.title = "+" + (parseInt(x.title.split(",")[0]) + 1) + ", -" + (parseInt(x.title.split("-")[1]) - 1)
     }
    }
    else {
     if (x.vote == -1) {
      x.vote = 0;
      x.href = x.href.split("?")[0] + "?downvote=-1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) + 1;
      x.title = x.title.split("-")[0] + "-" + (parseInt(x.title.split("-")[1]) - 1)
     }
     else if (x.vote == 0) {
      x.vote = -1;
      x.href = x.href.split("?")[0] + "?downvote=1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) - 1;
      x.title = x.title.split("-")[0] + "-" + (parseInt(x.title.split("-")[1]) + 1)
     }
     else if (x.vote == 1) {
      x.vote = -1;
      x.href = x.href.split("?")[0] + "?downvote=1&upvote=-1";
      x.previousSibling.innerHTML = parseInt(x.previousSibling.innerHTML) - 2;
      x.title = "+" + (parseInt(x.title.split(",")[0]) - 1) + ", -" + (parseInt(x.title.split("-")[1]) + 1)
     }
    }
   }
  };
  this.onmouseout = function (e) {
   onmousemove = onmousedown = x = null;
   if (this.vote == 0) {this.innerHTML = "&#8661;"}
   else if (this.vote == 1) {this.innerHTML = "&uArr;"}
   else if (this.vote == -1) {this.innerHTML = "&dArr;"}
  }
 });

 $(".frsubmit").each(function () {
  this.onkeypress = function (e) {
   if (e.which == 13) {
    $(this).closest('form').submit()
   }
  }
 });

 $('#frform').bind('ajax:beforeSend', function () {
  $('#list').html('<div class="eqlist"><div>Loading...</div></div>')
 }).bind('ajax:success', function (evt, data, status, xhr) {
  $('#list').html(data)
 })
};
