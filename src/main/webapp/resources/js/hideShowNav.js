/**
 * 
 */
(function () {
  var prevScroll = window.scrollY || document.documentElement.scrollTop;
  var curScroll;
  var direction = 0;
  var prevDirection = 0;

  var nav = document.querySelector(".navbar");

  var checkScroll = function () {
    /*
     ** Find the direction of scroll
     ** 0 - initial, 1 - up, 2 - down
     */

    curScroll = window.scrollY || document.documentElement.scrollTop;
    if (curScroll > prevScroll) {
      //scrolled up
      direction = 2;
    } else if (curScroll < prevScroll) {
      //scrolled down
      direction = 1;
    }

    if (direction !== prevDirection) {
      toggleNav(direction, curScroll);
    }

    prevScroll = curScroll;
  };

  var toggleNav = function (direction, curScroll) {
    if (direction === 2 && curScroll > 100) {
      nav.classList.add("hide");
      prevDirection = direction;
    } else if (direction === 1) {
      nav.classList.remove("hide");
      prevDirection = direction;
    }
  };

  window.addEventListener("scroll", checkScroll);
})();
