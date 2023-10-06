function darkmode() {
  let element = document.body;
  let checkbox = document.getElementById("dark-checkbox");

  if (checkbox.checked) {
    element.classList.add("dark-mode");
    localStorage.setItem("dark-mode-enabled", "true");
  } else {
    element.classList.remove("dark-mode");
    localStorage.setItem("dark-mode-enabled", "false");
  }
}

function chackDarkMode() {
  let $body = $("body");
  let $checkbox = $("#dark-checkbox");
  let darkModeEnabled = localStorage.getItem("dark-mode-enabled");
  let $logoImg = $("#logoImg-1");
  let $footerLogoImg = $("#footerLogoImg")
  let $logofooter = $('#logo-footer');
  let $packageImg = $("#packageImg");
  let $packageImg1 = $("#packageImg1");
  let $discountImg1 = $("#discountImg1");
  let $boxImg1 = $("#boxImg1");
  let $packageImg2 = $("#packageImg2");
  let $discountImg2 = $("#discountImg2");
  let $boxImg2 = $("#boxImg2");
  let $darkPackageImg = $("#darkPackageImg");
  let $darkPackageImg1 = $("#darkPackageImg1");
  let $darkDiscountImg1 = $("#darkDiscountImg1");
  let $darkBoxImg1 = $("#darkBoxImg1");
  let $darkPackageImg2 = $("#darkPackageImg2");
  let $darkDiscountImg2 = $("#darkDiscountImg2");
  let $darkBoxImg2 = $("#darkBoxImg2");

  if (darkModeEnabled === "true") {
    $body.addClass("dark-mode");
    $logoImg.attr("src", "/img/LOGO(1)-W.png");
    $footerLogoImg.attr("src", "/img/LOGO(1)-W.png");
    $logofooter.attr("src", "/img/LOGO(1)-W.png");
    $packageImg.attr("src", "/img/whitepackage.png");
    $packageImg1.attr("src", "/img/whitepackage.png");
    $discountImg1.attr("src", "/img/whitediscount.png");
    $boxImg1.attr("src", "/img/white기타.png");
    $packageImg2.attr("src", "/img/whitepackage.png");
    $discountImg2.attr("src", "/img/whitediscount.png");
    $boxImg2.attr("src", "/img/white기타.png");
    $darkPackageImg.attr("src", "/img/whitepackage.png");
    $darkPackageImg1.attr("src", "/img/whitepackage.png");
    $darkDiscountImg1.attr("src", "/img/whitediscount.png");
    $darkBoxImg1.attr("src", "/img/white기타.png");
    $darkPackageImg2.attr("src", "/img/whitepackage.png");
    $darkDiscountImg2.attr("src", "/img/whitediscount.png");
    $darkBoxImg2.attr("src", "/img/white기타.png");
    $checkbox.prop("checked", true);

    $("#img1").attr("src", "/img/res3.jpg");
    $("#img2").attr("src", "/img/hotel15.jpg");
    $("#img3").attr("src", "/img/pool2.jpg");
    $("#packageImg").attr("src", "/img/whitepackage.png");
    $("#packageImg1").attr("src", "/img/whitepackage.png");
    $("#discountImg1").attr("src", "/img/whitediscount.png");
    $("#boxImg1").attr("src", "/img/white기타.png");
    $("#packageImg2").attr("src", "/img/whitepackage.png");
    $("#discountImg2").attr("src", "/img/whitediscount.png");
    $("#boxImg2").attr("src", "/img/white기타.png");

    $("#darkPackageImg").attr("src", "/img/whitepackage.png");
    $("#darkPackageImg1").attr("src", "/img/whitepackage.png");
    $("#darkDiscountImg1").attr("src", "/img/whitediscount.png");
    $("#darkBoxImg1").attr("src", "/img/white기타.png");
    $("#darkPackageImg2").attr("src", "/img/whitepackage.png");
    $("#darkDiscountImg2").attr("src", "/img/whitediscount.png");
    $("#darkBoxImg2").attr("src", "/img/white기타.png");
  } else {
    $body.removeClass("dark-mode");
    $logoImg.attr("src", "/img/LOGO(1)-B.png");
    $footerLogoImg.attr("src", "/img/LOGO(1)-B.png");
    $logofooter.attr("src", "/img/LOGO(1)-B.png");
    $packageImg.attr("src", "/img/package.png");
    $packageImg1.attr("src", "/img/package.png");
    $discountImg1.attr("src", "/img/discount.png");
    $boxImg1.attr("src", "/img/기타.png");
    $packageImg2.attr("src", "/img/package.png");
    $discountImg2.attr("src", "/img/discount.png");
    $boxImg2.attr("src", "/img/기타.png");
    $darkPackageImg.attr("src", "/img/package.png");
    $darkPackageImg1.attr("src", "/img/package.png");
    $darkDiscountImg1.attr("src", "/img/discount.png");
    $darkBoxImg1.attr("src", "/img/기타.png");
    $darkPackageImg2.attr("src", "/img/package.png");
    $darkDiscountImg2.attr("src", "/img/discount.png");
    $darkBoxImg2.attr("src", "/img/기타.png");
    $checkbox.prop("checked", false);

    $("#img1").attr("src", "/img/pool6.jpg");
    $("#img2").attr("src", "/img/pool4.jpg");
    $("#img3").attr("src", "/img/pool.jpg");
    $("#packageImg").attr("src", "/img/package.png");
    $("#packageImg1").attr("src", "/img/package.png");
    $("#discountImg1").attr("src", "/img/discount.png");
    $("#boxImg1").attr("src", "/img/기타.png");
    $("#packageImg2").attr("src", "/img/package.png");
    $("#discountImg2").attr("src", "/img/discount.png");
    $("#boxImg2").attr("src", "/img/기타.png");
    $("#darkPackageImg").attr("src", "/img/package.png");
    $("#darkPackageImg1").attr("src", "/img/package.png");
    $("#darkDiscountImg1").attr("src", "/img/discount.png");
    $("#darkBoxImg1").attr("src", "/img/기타.png");
    $("#darkPackageImg2").attr("src", "/img/package.png");
    $("#darkDiscountImg2").attr("src", "/img/discount.png");
    $("#darkBoxImg2").attr("src", "/img/기타.png");
  }

  $checkbox.on("change", function () {
    if ($checkbox.prop("checked")) {
      $logoImg.attr("src", "/img/LOGO(1)-W.png");
      $footerLogoImg.attr("src", "/img/LOGO(1)-W.png");
      $logofooter.attr("src", "/img/LOGO(1)-W.png");
      $packageImg.attr("src", "/img/whitepackage.png");
      $packageImg1.attr("src", "/img/whitepackage.png");
      $discountImg1.attr("src", "/img/whitediscount.png");
      $boxImg1.attr("src", "/img/white기타.png");
      $packageImg2.attr("src", "/img/whitepackage.png");
      $discountImg2.attr("src", "/img/whitediscount.png");
      $boxImg2.attr("src", "/img/white기타.png");
      $darkPackageImg.attr("src", "/img/whitepackage.png");
      $darkPackageImg1.attr("src", "/img/whitepackage.png");
      $darkDiscountImg1.attr("src", "/img/whitediscount.png");
      $darkBoxImg1.attr("src", "/img/white기타.png");
      $darkPackageImg2.attr("src", "/img/whitepackage.png");
      $darkDiscountImg2.attr("src", "/img/whitediscount.png");
      $darkBoxImg2.attr("src", "/img/white기타.png");
      $body.addClass("dark-mode");
      localStorage.setItem("dark-mode-enabled", "true");
      $("#img1").attr("src", "/img/res3.jpg");
      $("#img2").attr("src", "/img/hotel15.jpg");
      $("#img3").attr("src", "/img/pool2.jpg");
      $("#packageImg").attr("src", "/img/whitepackage.png");
      $("#packageImg1").attr("src", "/img/whitepackage.png");
      $("#discountImg1").attr("src", "/img/whitediscount.png");
      $("#boxImg1").attr("src", "/img/white기타.png");
      $("#packageImg2").attr("src", "/img/whitepackage.png");
      $("#discountImg2").attr("src", "/img/whitediscount.png");
      $("#boxImg2").attr("src", "/img/white기타.png");
      $("#darkPackageImg").attr("src", "/img/whitepackage.png");
      $("#darkPackageImg1").attr("src", "/img/whitepackage.png");
      $("#darkDiscountImg1").attr("src", "/img/whitediscount.png");
      $("#darkBoxImg1").attr("src", "/img/white기타.png");
      $("#darkPackageImg2").attr("src", "/img/whitepackage.png");
      $("#darkDiscountImg2").attr("src", "/img/whitediscount.png");
      $("darkBoxImg2").attr("src", "/img/white기타.png");
    } else {
      $body.removeClass("dark-mode");
      $logoImg.attr("src", "/img/LOGO(1)-B.png");
      $footerLogoImg.attr("src", "/img/LOGO(1)-B.png");
      $logofooter.attr("src", "/img/LOGO(1)-B.png");
      $packageImg.attr("src", "/img/package.png");
      $packageImg1.attr("src", "/img/package.png");
      $discountImg1.attr("src", "/img/discount.png");
      $boxImg1.attr("src", "/img/기타.png");
      $packageImg2.attr("src", "/img/package.png");
      $discountImg2.attr("src", "/img/discount.png");
      $boxImg2.attr("src", "/img/기타.png");
      $darkPackageImg.attr("src", "/img/package.png");
      $darkPackageImg1.attr("src", "/img/package.png");
      $darkDiscountImg1.attr("src", "/img/discount.png");
      $darkBoxImg1.attr("src", "/img/기타.png");
      $darkPackageImg2.attr("src", "/img/package.png");
      $darkDiscountImg2.attr("src", "/img/discount.png");
      $darkBoxImg2.attr("src", "/img/기타.png");
      localStorage.setItem("dark-mode-enabled", "false");
      $("#img1").attr("src", "/img/pool6.jpg");
      $("#img2").attr("src", "/img/pool4.jpg");
      $("#img3").attr("src", "/img/pool.jpg");
      $("#packageImg").attr("src", "/img/package.png");
      $("#packageImg1").attr("src", "/img/package.png");
      $("#discountImg1").attr("src", "/img/discount.png");
      $("#boxImg1").attr("src", "/img/기타.png");
      $("#packageImg2").attr("src", "/img/package.png");
      $("#discountImg2").attr("src", "/img/discount.png");
      $("#boxImg2").attr("src", "/img/기타.png");
      $("#darkPackageImg").attr("src", "/img/package.png");
      $("#darkPackageImg1").attr("src", "/img/package.png");
      $("#darkDiscountImg1").attr("src", "/img/discount.png");
      $("#darkBoxImg1").attr("src", "/img/기타.png");
      $("#darkPackageImg2").attr("src", "/img/package.png");
      $("#darkDiscountImg2").attr("src", "/img/discount.png");
      $("#darkBoxImg2").attr("src", "/img/기타.png");
    }
  });
}

function googleTranslateElementInit() {
  new google.translate.TranslateElement(
    {
      pageLanguage: "ko",
      includedLanguages: "ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar",
      layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
      autoDisplay: false,
    },
    "google_translate_element"
  );
}

$(document).ready(function () {
  chackDarkMode();

  //동현

  $("#r-b").click(function () {
    location.href = "/hotel/client/roombook";
  });
  $("#mainbookbtn").click(function () {
    const from = $("#from").val();
    const to = $("#to").val();
    const day = $(".night").text();
    sessionStorage.setItem("from", from);
    sessionStorage.setItem("day", day);
    sessionStorage.setItem("to", to);
    location.href = "/hotel/client/roombook";
  });
  $(".bookbtn").click(function () {
    $("#booknewdim").attr("style", "display:block;");
    $("#bookBox").attr("style", "display:block");
    $("html").attr("style", "overflow: hidden");
  });
  $("#bookbtn2").click(function () {
    $("#booknewdim").attr("style", "display:none;");
    $("#bookBox").attr("style", "display:none");
    $("html").attr("style", "overflow:none");
  });
  $("#bookbedbox").click(function () {
    location.href = "/hotel/client/roombook";
  });
  $("#bookrestbox").click(function () {
    location.href = "/hotel/client/dinnerbook";
  });

  $("#dark-checkbox").click(function () {
    if ($(this).is(":checked")) {
      $("#img3").attr("src", "/img/pool2.jpg");
      $("#img2").attr("src", "/img/night2.jpg");
      $("#img1").attr("src", "/img/night.jpg");
    } else {
      $("#img1").attr("src", "/img/pool.jpg");
      $("#img3").attr("src", "/img/lobby.jpg");
      $("#img2").attr("src", "/img/room.jpg");
    }
  });

  //데이터 피커
  const today = new Date();
  let dateFormat = "mm/dd/yy",
    from = $("#from")
      .datepicker({
        defaultDate: null,
        changeMonth: true,
        numberOfMonths: 1,
        minDate: today,
      })
      .on("change", function () {
        const selectedDate = getDate(this);
        to.datepicker("option", "minDate", selectedDate);
        to.datepicker("option", "beforeShowDay", function (date) {
          return [date.getTime() !== selectedDate.getTime()];
        });
        const $to = $("#to");
        $to.prop("disabled", false);
      }),
    to = $("#to")
      .datepicker({
        defaultDate: null,
        changeMonth: true,
        numberOfMonths: 1,
      })
      .on("change", function () {
        const selectedDate = getDate(this);
        from.datepicker("option", "maxDate", selectedDate);
        $(".night").text(calculateNight());
      });

  function getDate(element) {
    let date;
    try {
      date = $.datepicker.parseDate(dateFormat, element.value);
    } catch (error) {
      date = null;
    }
    return date;
  }

  function calculateNight() {
    const splitFrom = from.val().split("/");
    const fromYear = splitFrom[2];
    const fromMonth = splitFrom[0] - 1;
    const fromDay = splitFrom[1];
    const intFrom = new Date(fromYear, fromMonth, fromDay);
    const splitTo = to.val().split("/");
    const toYear = splitTo[2];
    const toMonth = splitTo[0] - 1;
    const toDay = splitTo[1];
    const intTo = new Date(toYear, toMonth, toDay);
    const diffInMilliseconds = intTo - intFrom;
    const diffInSeconds = diffInMilliseconds / 1000;
    const diffInMinutes = diffInSeconds / 60;
    const diffInHours = diffInMinutes / 60;
    const diffInDays = diffInHours / 24;
    let night = Math.floor(diffInDays);

    return night + "박";
  }
  //데이터피커
});
